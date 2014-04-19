#
#  DEBIAN - Debian <.deb> Packages Helpers [BASH script version]
#
#  author    Juan J Gonzalez Cardenas [Jota Jota] - <https://github.com/MyXelf/mx-dot-files>
#  version   1.0.0.0
#  date      06.Apr.2014
#
#  legal     Copyright (c) 2014. Licensed under the MIT license.
#

#
# Function: alinks()
#
# Handle the packages links generated by 'apt-get --print-uris'
#
# Completion enabled function. See 'alinks.completions.bash'
#
alinks () {
  local output_file=$MXDF_VOLATILE/apt-links.txt

  local pack_url pack_size pack_md5 pack_path pack_name pack_nver verbose=''
  local url_pattern="(.*/)([^_]*)(.*)"
  local grand_size=0 count=0

  # Process functions options
  while [ ! -z "$1" ]; do
    case "$1" in
      --append | -a )
        local opt_append=1
        ;&

      --file | -f )
        local opt_tofile=1
        ;;

      --list | -l)
        [ -f $output_file ] && cat $output_file || e_cm "Empty File: '$output_file'"
        return $E_SUCCESS
        ;;

      --verbose | -v )
        local opt_verbose=1
        ;;

      --help | -h )
        _mxdf_show_header $BASH_SOURCE

        echo "alinks is a front-end to the \"apt-get --print-uris\" command to ease the handling"
        echo "of packages URLs. Each line will contain the size (in human readable format),"
        echo "the URL and optionally the MD5 checksum of the related package."
        echo
        echo "The URLs of the selected packages can be output (or appended) to a file that can"
        echo "be used later with a Download Manager (-f option)."
        echo
        echo "The default is 'dist-upgrade' if no command is specified. BASH completion is"
        echo "available for the commands, options and packages names."
        echo
        echo "Usage:"
        echo "  alinks [<options>] [upgrade | dist-upgrade]"
        echo "  alinks [<options>] install <dpk1> [<dpk2> ...]"
        echo
        echo "Example:"
        echo "  alinks -f install kdevelop"
        echo
        echo "Options:"
        echo "  -a, --append    append the results to the output file (implies -f)"
        echo "  -f, --file      output only the URLs to the file \"${output_file}\""
        echo "  -l, --list      display the content of the default output file"
        echo "  -v, --verbose   be verbose (include the MD5 checksum for each package)"
        echo "  -h, --help      print this help message and exit"

        _mxdf_show_copyright

        return $E_SUCCESS
        ;;

      install | upgrade | dist-upgrade )
        local action="$@"
        break
        ;;

      * )
        e_em "Unknown parameter in command line: $@\n       Try '$FUNCNAME --help' for more information."
        return $E_FAILURE
        ;;
    esac

    shift
  done

  # dist-upgrade is the default action
  [ -z "$action" ] && local action='dist-upgrade'

  # Remove previously existent file if no appending content
  [[ -n "$opt_tofile" && -z "$opt_append" ]] && rm -f "$output_file" > /dev/null 2>&1

  while read pack_url _ pack_size pack_md5; do
    # Remove single quotes
    pack_url=${pack_url:1:-1}

    [[ $pack_url =~ $url_pattern ]]
    pack_path=${BASH_REMATCH[1]}
    pack_name=${BASH_REMATCH[2]}
    pack_nver=${BASH_REMATCH[3]}

    # Be Verbose (include the MD5SUM)
    [ -n "$opt_verbose" ] && verbose="  ${RED}${pack_md5:7}"

    let "grand_size += pack_size"
    pack_size=$(numfmt --to=iec-i --suffix=B --format=%7f $pack_size)

    e_ac "${I_GRAY}${pack_size}${R_COLOR}  ${WHITE}${pack_path}${I_YELLOW}${pack_name}${WHITE}${pack_nver}${verbose}${R_COLOR}"

    # Output to the requested file
    [ -n "$opt_tofile" ] && echo $pack_url >> "$output_file"

    let count++
  done < <(apt-get -qq --print-uris $action)

  if [ $count -gt 0 ]; then
    local fop=''

    # If output to file, save the done action
    if [ -n "$opt_tofile" ]; then
      [ -z "$opt_append" ] && fop="(output to: '$output_file')" || fop="(append to: '$output_file')"
    fi

    # Print the Grand Total plus the amount of packages and any done file operation
    [[ $count -gt 1 || -n "$fop" ]] && e_hc "= $(numfmt --to=iec-i --suffix=B --format=%7f $grand_size)  = $count packages $fop"
  fi

  return $E_SUCCESS
}


# --------------------------------------------------------------------------------------------------
#  Aliases Definitions
# --------------------------------------------------------------------------------------------------
