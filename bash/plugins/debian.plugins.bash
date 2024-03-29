#
#  DEBIAN - Debian <.deb> Packages Helpers [BASH script version]
#
#  author    Juan J Gonzalez Cardenas [Jota Jota] - <https://github.com/MyXelf/mx-dot-files>
#  version   1.0.0.0
#  date      06.Apr.2014
#
#  legal     Copyright © 2014-2024. Licensed under the MIT license.
#

#
# Function: alinks()
#
# Handle the packages links generated by 'apt-get --print-uris'
#
# Completion enabled function
#
alinks () {
  local output_file=$MXDF_VOLATILE/apt-links.txt

  local pack_url pack_size pack_md5 pack_path pack_name pack_nver verbose=''
  local url_pattern="(.*/)([^_]*)(.*)"
  local grand_size=0 count=0

  # Process command line options
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
        _debian_plugin_help $FUNCNAME
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
  [[ -n $opt_tofile && -z $opt_append ]] && rm -f "$output_file" &>/dev/null

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
#  Base Functions
# --------------------------------------------------------------------------------------------------

#
# Function: _debian_plugin_help()
#
# Display the Help for the plugin and the related functions
#
_debian_plugin_help () {
  _mxdf_show_header $BASH_SOURCE

  case "$1" in
    alinks ) cat <<__HEREDOC_ALINKS_HELP
alinks is a front-end to the "apt-get --print-uris" command to ease the
handling of packages URLs. Each line will contain the size (in human readable
format), the URL and optionally the MD5 checksum of the related package.

The URLs of the selected packages can be output (or appended) to a file that
can be used later with a Download Manager (-f option).

The default is 'dist-upgrade' if no command is specified. BASH completion is
available for the commands, options and packages names.

Usage:
  alinks [<options>] [upgrade | dist-upgrade]
  alinks [<options>] install <dpk1> [<dpk2> ...]

Example:
  alinks -f install kdevelop

Options:
  -a, --append    append the results to the output file (implies -f)
  -f, --file      output only the URLs to the file "${output_file}"
  -l, --list      display the content of the default output file
  -v, --verbose   be verbose (include the MD5 checksum for each package)
  -h, --help      print this help message and exit
__HEREDOC_ALINKS_HELP
      ;;

    * ) _describe_component_item $BASH_SOURCE
      ;;
  esac

  _mxdf_show_copyright
}

# --------------------------------------------------------------------------------------------------
#  Aliases Definitions
# --------------------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------------------
#  Completion Helpers
# --------------------------------------------------------------------------------------------------

#
# Function: _alinks_complete()
#
# Completion for the alinks() function
#
_alinks_complete () {
  local cur prev words cword
  _init_completion || return

  case $prev in
    install )
      COMPREPLY=( $(apt-cache --no-generate pkgnames "$cur" 2>/dev/null) )
      return 0
      ;;
  esac

  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $( compgen -W '$( _parse_help "$1" )' -- "$cur" ) )
    return 0
  fi

  COMPREPLY=( $(compgen -W 'install upgrade dist-upgrade' -- "$cur") )
} &&
complete -F _alinks_complete alinks

