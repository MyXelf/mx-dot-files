#
#  DROID-TOOLS - Android Tools Suite [BASH script version]
#
#  author    Juan J Gonzalez Cardenas [Jota Jota] - <https://github.com/MyXelf/mx-dot-files>
#  version   1.0.0.5
#  date      12.Oct.2014
#
#  legal     Copyright (c) 2012-2014. Licensed under the MIT license.
#

#
# Function: asdk()
#
# Display information about the Android Software Development Kit
#
asdk () {
  e_hr 'Android Tools Suite' 'Software Development Kit' '\n'

  echo "Android development happens around families of releases, which use code names"
  echo "ordered alphabetically after tasty treats. The code names match the following"
  echo "version numbers, along with API levels and NDK releases:"
  echo

  e_cm "Code Name             Version         API Level"
  for api_level in "${aapi_level[@]}"; do
    e_ac "$api_level"
  done

  [[ $1 != '-v' && $1 != '--verbose' ]] && return $E_SUCCESS

  # Source Code Tags and Builds
  echo
  echo 'Starting with Donut, the exact list of tags and builds is in the following table'
  echo

  e_cm 'Build        Branch                   Version                 Supported Devices'
  e_ac 'KTU84Q       android-4.4.4_r2         KitKat                  Nexus 5 (hammerhead) (For 2Degrees/NZ, Telstra/AUS and India ONLY)'
  e_ac 'KTU84P       android-4.4.4_r1         KitKat                  Nexus 5, Nexus 7 (flo/grouper/tilapia), Nexus 4, Nexus 10'
  e_ac 'KTU84M       android-4.4.3_r1.1       KitKat                  Nexus 5 (hammerhead)'
  e_ac 'KTU84L       android-4.4.3_r1         KitKat                  Nexus 7 (flo/deb/grouper/tilapia), Nexus 4, Nexus 10'
  e_ac 'KVT49L       android-4.4.2_r2         KitKat                  Nexus 7 (deb Verizon)'
  e_ac 'KOT49H       android-4.4.2_r1         KitKat                  Nexus 5, Nexus 7 (flo/deb/grouper/tilapia), Nexus 4, Nexus 10'
  e_ac 'KOT49E       android-4.4.1_r1         KitKat                  Nexus 5, Nexus 7 (flo/deb/grouper/tilapia), Nexus 4, Nexus 10'
  e_ac 'KRT16S       android-4.4_r1.2         KitKat                  Nexus 7 (flo/deb/grouper/tilapia), Nexus 4, Nexus 10'
  e_ac 'KRT16M       android-4.4_r1           KitKat                  Nexus 5 (hammerhead)'
  e_ac 'JLS36I       android-4.3.1_r1         Jelly Bean              Nexus 7 (deb)'
  e_ac 'JLS36C       android-4.3_r3           Jelly Bean              Nexus 7 (deb)'
  e_ac 'JSS15R       android-4.3_r2.3         Jelly Bean              Nexus 7 (flo)'
  e_ac 'JSS15Q       android-4.3_r2.2         Jelly Bean              Nexus 7 (flo)'
  e_ac 'JSS15J       android-4.3_r2.1         Jelly Bean              Nexus 7 (flo/deb)'
  e_ac 'JSR78D       android-4.3_r2           Jelly Bean              Nexus 7 (deb)'
  e_ac 'JWR66Y       android-4.3_r1.1         Jelly Bean              Galaxy Nexus, Nexus 7 (grouper/tilapia), Nexus 4, Nexus 10'
  e_ac 'JWR66V       android-4.3_r1           Jelly Bean              Galaxy Nexus, Nexus 7 (grouper/tilapia), Nexus 4, Nexus 10'
  e_ac 'JWR66N       android-4.3_r0.9.1       Jelly Bean              Galaxy Nexus, Nexus 7 (grouper/tilapia/flo), Nexus 4, Nexus 10'
  e_ac 'JWR66L       android-4.3_r0.9         Jelly Bean              Nexus 7'
  e_ac 'JDQ39E       android-4.2.2_r1.2       Jelly Bean              Nexus 4'
  e_ac 'JDQ39B       android-4.2.2_r1.1       Jelly Bean              Nexus 7'
  e_ac 'JDQ39        android-4.2.2_r1         Jelly Bean              Galaxy Nexus, Nexus 7, Nexus 4, Nexus 10'
  e_ac 'JOP40G       android-4.2.1_r1.2       Jelly Bean              Nexus 4'
  e_ac 'JOP40F       android-4.2.1_r1.1       Jelly Bean              Nexus 10'
  e_ac 'JOP40D       android-4.2.1_r1         Jelly Bean              Galaxy Nexus, Nexus 7, Nexus 4, Nexus 10'
  e_ac 'JOP40C       android-4.2_r1           Jelly Bean              Galaxy Nexus, Nexus 7, Nexus 4, Nexus 10'
  e_ac 'JZO54M       android-4.1.2_r2.1       Jelly Bean'
  e_ac 'JZO54L       android-4.1.2_r2         Jelly Bean'
  e_ac 'JZO54K       android-4.1.2_r1         Jelly Bean              Nexus S, Galaxy Nexus, Nexus 7'
  e_ac 'JRO03S       android-4.1.1_r6.1       Jelly Bean              Nexus 7'
  e_ac 'JRO03R       android-4.1.1_r6         Jelly Bean              Nexus S 4G'
  e_ac 'JRO03O       android-4.1.1_r5         Jelly Bean              Galaxy Nexus'
  e_ac 'JRO03L       android-4.1.1_r4         Jelly Bean              Nexus S'
  e_ac 'JRO03H       android-4.1.1_r3         Jelly Bean'
  e_ac 'JRO03E       android-4.1.1_r2         Jelly Bean              Nexus S'
  e_ac 'JRO03D       android-4.1.1_r1.1       Jelly Bean              Nexus 7'
  e_ac 'JRO03C       android-4.1.1_r1         Jelly Bean              Galaxy Nexus'
  e_ac 'IMM76L       android-4.0.4_r2.1       Ice Cream Sandwich'
  e_ac 'IMM76K       android-4.0.4_r2         Ice Cream Sandwich      Galaxy Nexus'
  e_ac 'IMM76I       android-4.0.4_r1.2       Ice Cream Sandwich      Galaxy Nexus'
  e_ac 'IMM76D       android-4.0.4_r1.1       Ice Cream Sandwich      Nexus S, Nexus S 4G, Galaxy Nexus'
  e_ac 'IMM76        android-4.0.4_r1         Ice Cream Sandwich'
  e_ac 'IML77        android-4.0.3_r1.1       Ice Cream Sandwich'
  e_ac 'IML74K       android-4.0.3_r1         Ice Cream Sandwich      Nexus S'
  e_ac 'ICL53F       android-4.0.2_r1         Ice Cream Sandwich      Galaxy Nexus'
  e_ac 'ITL41F       android-4.0.1_r1.2       Ice Cream Sandwich      Galaxy Nexus'
  e_ac 'ITL41D       android-4.0.1_r1.1       Ice Cream Sandwich      Galaxy Nexus'
  e_ac 'ITL41D       android-4.0.1_r1         Ice Cream Sandwich      Galaxy Nexus'
  e_ac 'GWK74        android-2.3.7_r1         Gingerbread             Nexus S 4G'
  e_ac 'GRK39F       android-2.3.6_r1         Gingerbread             Nexus One, Nexus S'
  e_ac 'GRK39C       android-2.3.6_r0.9       Gingerbread             Nexus S'
  e_ac 'GRJ90        android-2.3.5_r1         Gingerbread             Nexus S 4G'
  e_ac 'GRJ22        android-2.3.4_r1         Gingerbread             Nexus One, Nexus S, Nexus S 4G'
  e_ac 'GRJ06D       android-2.3.4_r0.9       Gingerbread             Nexus S 4G'
  e_ac 'GRI54        android-2.3.3_r1.1       Gingerbread             Nexus S'
  e_ac 'GRI40        android-2.3.3_r1         Gingerbread             Nexus One, Nexus S'
  e_ac 'GRH78C       android-2.3.2_r1         Gingerbread             Nexus S'
  e_ac 'GRH78        android-2.3.1_r1         Gingerbread             Nexus S'
  e_ac 'GRH55        android-2.3_r1           Gingerbread             earliest Gingerbread version, Nexus S'
  e_ac 'FRK76C       android-2.2.3_r2         Froyo'
  e_ac 'FRK76        android-2.2.3_r1         Froyo'
  e_ac 'FRG83G       android-2.2.2_r1         Froyo                   Nexus One'
  e_ac 'FRG83D       android-2.2.1_r2         Froyo                   Nexus One'
  e_ac 'FRG83        android-2.2.1_r1         Froyo                   Nexus One'
  e_ac 'FRG22D       android-2.2_r1.3         Froyo'
  e_ac 'FRG01B       android-2.2_r1.2         Froyo'
  e_ac 'FRF91        android-2.2_r1.1         Froyo                   Nexus One'
  e_ac 'FRF85B       android-2.2_r1           Froyo                   Nexus One'
  e_ac 'EPF21B       android-2.1_r2.1p2       Eclair'
  e_ac 'ESE81        android-2.1_r2.1s        Eclair'
  e_ac 'EPE54B       android-2.1_r2.1p        Eclair                  Nexus One'
  e_ac 'ERE27        android-2.1_r2           Eclair                  Nexus One'
  e_ac 'ERD79        android-2.1_r1           Eclair                  Nexus One'
  e_ac 'ESD56        android-2.0.1_r1         Eclair'
  e_ac 'ESD20        android-2.0_r1           Eclair'
  e_ac 'DMD64        android-1.6_r1.5         Donut'
  e_ac 'DRD20        android-1.6_r1.4'
  e_ac 'DRD08        android-1.6_r1.3'
  e_ac 'DRC92        android-1.6_r1.2'
}

#
# Function: _apkv()
#
# Return an array with the relevant information of an .apk file
#
_apkv () {
  # Regular Expressions patterns
  local pattern_app="application: label='(.*)' icon="
  local pattern_pkg="package: name='(.*)' versionCode='(.*)' versionName='(.*)'"
  local pattern_sdk="sdkVersion:'(.*)'"
  local apk_line

  if [ ! -f "$1" ]; then
    e_em "No $1 file. Please provide a valid .apk file." '\n'
    return $E_FAILURE
  fi

  while read apk_line; do
    case "$apk_line" in
      'application: '* )
        if [[ $apk_line =~ $pattern_app ]]; then
          apkv_return[${apkv_pos["label"]}]=${BASH_REMATCH[1]}
        fi
        ;;

      'package: '* )
        if [[ $apk_line =~ $pattern_pkg ]]; then
          apkv_return[${apkv_pos["packn"]}]=${BASH_REMATCH[1]}
          apkv_return[${apkv_pos["vname"]}]=${BASH_REMATCH[3]}
          apkv_return[${apkv_pos["vcode"]}]=${BASH_REMATCH[2]}
        fi
        ;;

      'sdkVersion:'* )
        if [[ $apk_line =~ $pattern_sdk ]]; then
          apkv_return[${apkv_pos["asdkv"]}]=${BASH_REMATCH[1]}
        fi
        ;;
    esac

  done < <(aapt dump badging "$1" 2> /dev/null)

  return $E_SUCCESS
}

#
# Function: apki()
#
# Return the relevant information returned from apkv() function
#
apki () {
  e_hr 'Android Tools Suite' 'APK Information Tool' '\n'

  local apk_file

  for apk_file in "$@"; do
    _apkv "$apk_file"

    [ $? -eq $E_FAILURE ] && continue

    e_cm 'File Name    =' $apk_file
    e_ac 'Application  :' ${apkv_return[${apkv_pos['label']}]}
    e_ac 'Package Name :' ${apkv_return[${apkv_pos["packn"]}]}
    e_ac 'Version Name :' ${apkv_return[${apkv_pos["vname"]}]}
    e_ac 'Version Code :' ${apkv_return[${apkv_pos["vcode"]}]}
    e_ac 'Android vOS  :' ${aapi_level[${apkv_return[${apkv_pos["asdkv"]}]}]} '\n'
  done

  return $E_SUCCESS
}

#
# Function: apkr()
#
# Rename .apk files
#
apkr () {
  e_hr 'Android Tools Suite' 'APK Rename Tool' '\n'

  local apk_file template_match filename_prefix apk_filename filename_suffix action xtra

  for apk_file in "$@"; do
    _apkv "$apk_file"

    [ $? -eq $E_FAILURE ] && return $E_FAILURE

    # Look for the package name inside the templates and obtain the prefix to use
    # TODO: Use BASH_REMATCH instead of the pipe, to improve performance
    [ -f $APKR_TEMPLATES ] && template_match=$(grep -m1 "^${apkv_return[${apkv_pos["packn"]}]} =" $APKR_TEMPLATES | cut -d' ' -f3-)

    # Reflect if a template was found
    if [ -n "$template_match" ]; then
      filename_prefix=$template_match
      xtra=" [T]"
    else
      # Use the application name or the package name as the filename prefix
      [ -n "${apkv_return[${apkv_pos['label']}]}" ] && filename_prefix=${apkv_return[${apkv_pos['label']}]} || filename_prefix=${apkv_return[${apkv_pos["packn"]}]}
      xtra=
    fi

    # Append the version name (if existent)
    [ -n "${apkv_return[${apkv_pos["vname"]}]}" ] && filename_prefix=${filename_prefix}-${apkv_return[${apkv_pos["vname"]}]}

    # Replace spaces with hyphens
    # TODO: Filter the rest of invalid characters in $filename_prefix
    filename_prefix=${filename_prefix// /-}

    # Lowercase the filename
    filename_prefix=${filename_prefix,,}

    # Conform the initial filename
    apk_filename=${filename_prefix}.apk
    filename_suffix=

    # "Nothing to Do" action return value
    local ACTION_NTD=2

    # TODO
    # Here is an error in the logic of the unclashing process. The NTD
    # action must be determined before checking if the current file exists. If
    # there are 2 files (t.apk => x.apk) and (x.apk => z.apk) ... TBC

    # Determine the needed suffix to avoid clashing with already existent files
    while [ -f "$apk_filename" ]; do
      [ "$apk_file" = "$apk_filename" ] && action=$ACTION_NTD && break
      let filename_suffix--
      apk_filename=${filename_prefix}${filename_suffix}.apk
    done

    e_ac -n ${apk_file} '=' ${apk_filename}${xtra} '... '

    if [ "$action" != "$ACTION_NTD" ]; then
      mv "$apk_file" "$apk_filename" > /dev/null 2>&1
      action=$?
    fi

    # Output the result of the operation
    case "$action" in
      $ACTION_NTD ) echo 'NTD';;
      $E_SUCCESS  ) echo 'D!';;
      $E_FAILURE  ) echo 'I/O Error';;
      *           ) echo 'Unknown Error';;
    esac
  done

  return $E_SUCCESS
}

#
# Function: afwi()
#
# Return the relevant information obtained from FW files
#
afwi () {
  # Process command line options
  case "$1" in
    --list | -l )
      local opt_list=1
      shift
      ;;

    --help | -h )
      _droid_tools_plugin_help $FUNCNAME
      return $E_SUCCESS
      ;;
  esac

  e_hr 'Android Tools Suite' 'Firmware Information Tool' '\n'

  local fw_file m_prop m_value e_md5 e_rfn n_md5 embedded_length rcode

  for fw_file in "$@"; do
    if [ ! -f "$fw_file" ]; then
      e_em "No $fw_file file. Please provide a valid Android Firmware file." '\n'
      continue
    fi

    e_cm 'AFW File Name      =' $fw_file

    case $fw_file in
      # Sony / Sony Ericsson FW file
      *.ftf )
        e_ac 'FW Manufacturer    : Sony / Sony Ericsson'
        e_ac 'FW Flashing Tool   : FlashTool'

        # Read Manifest interesting values
        IFS=': '
        while read m_prop m_value; do
          case "$m_prop" in
            device   ) e_ac 'Manifest Device    :' $m_value;;
            branding ) e_ac 'Manifest Branding  :' $m_value;;
            version  ) e_ac 'Manifest Version   :' $m_value;;
          esac
        done < <(unzip -p "$fw_file" META-INF/MANIFEST.MF)

        echo
        [ -n "$opt_list" ] && unzip -v "$fw_file" | grep -F '%' | column -t | sed 's/^/  /' && echo
        ;;

      # Samsung FW file
      *.tar.md5 )
        # Workaround: Obtain the last 256 characters from the end of the file
        # and extract the MD5 and the original filename from that region.
        IFS='  ' read -r e_md5 e_rfn < <(tail -c256 $fw_file 2> /dev/null)

        e_ac 'FW Manufacturer    : Samsung'
        e_ac 'FW Flashing Tool   : Heimdall / Odin'

        [[ -z $e_rfn || -z $e_md5 ]] && echo -n '  ' && e_em 'Malformed or corrupt Samsung Firmware file' '\n' && continue

        e_ac 'Embedded File Name :' $e_rfn
        e_ac 'Embedded MD5 Check :' $e_md5

        # Calculate MD5 for validation purposes (unless asked for TAR content)
        if [ -z "$opt_list" ]; then
          echo -en "  ${I_GRAY}- Calculating MD5 Sum -${R_COLOR}"

          # Amount of content (in characters) to exclude from actual MD5 sum
          # equals to MD5 length + Filename length + 3 (2 spaces + \0A)
          let "embedded_length = ${#e_md5} + ${#e_rfn} + 3"
          read n_md5 _ < <(head --bytes=-$embedded_length $fw_file | md5sum)

          [ "$e_md5" = "$n_md5" ] && rcode="${I_YELLOW}OK!${R_COLOR}" || rcode="${RED}FAILED!${R_COLOR}"

          echo -en '\r'; e_ac 'Calculated MD5 Sum :' $n_md5 "-" $rcode '\n'
        else
          echo
          # Include the TAR file content (if option given)
          tar --list --verbose --file $fw_file | column -t | sed 's/^/  /' && echo
        fi
        ;;

      # Unknown FW file
      * )
        e_dm 'Unknown Android Firmware format'
        echo
        ;;
    esac
  done

  return $E_SUCCESS
}

#
# Function: dtools()
#
# Display the Help for the plugin and the related functions
#
dtools () {
  _droid_tools_plugin_help
}

# --------------------------------------------------------------------------------------------------
#  Base Functions
# --------------------------------------------------------------------------------------------------

#
# Function: _droid_tools_plugin_init()
#
# Setup the plugin required environment (Autoloading Function)
#
_droid_tools_plugin_init () {
  # Define the location of the templates for the apkr() function
  [ -z "$MXDF_ACTIVE" ] && APKR_TEMPLATES=$MXDF_BASH_LOCAL/droid-tools.apkr

  # The array returning the values from the _apkv() function
  declare -a -g apkv_return

  # Values positions in the returning array
  declare -A -g apkv_pos
  apkv_pos['label']=0     # Application Label
  apkv_pos['packn']=1     # Package Name
  apkv_pos['vname']=2     # Version Name
  apkv_pos['vcode']=3     # Version Code
  apkv_pos['asdkv']=4     # SDK Version

  # Android API information
  declare -a -g aapi_level
  aapi_level[ 1]='Base (No Code Name) | 1.0           | API  1'
  aapi_level[ 2]='Base (No Code Name) | 1.1           | API  2'
  aapi_level[ 3]='Cupcake             | 1.5           | API  3, NDK 1'
  aapi_level[ 4]='Donut               | 1.6           | API  4, NDK 2'
  aapi_level[ 5]='Eclair              | 2.0           | API  5'
  aapi_level[ 6]='Eclair              | 2.0.1         | API  6'
  aapi_level[ 7]='Eclair              | 2.1           | API  7, NDK 3'
  aapi_level[ 8]='Froyo               | 2.2.x         | API  8, NDK 4'
  aapi_level[ 9]='Gingerbread         | 2.3 - 2.3.2   | API  9, NDK 5'
  aapi_level[10]='Gingerbread         | 2.3.3 - 2.3.7 | API 10'
  aapi_level[11]='Honeycomb           | 3.0           | API 11'
  aapi_level[12]='Honeycomb           | 3.1           | API 12, NDK 6'
  aapi_level[13]='Honeycomb           | 3.2.x         | API 13'
  aapi_level[14]='Ice Cream Sandwich  | 4.0.1 - 4.0.2 | API 14, NDK 7'
  aapi_level[15]='Ice Cream Sandwich  | 4.0.3 - 4.0.4 | API 15, NDK 8'
  aapi_level[16]='Jelly Bean          | 4.1.x         | API 16'
  aapi_level[17]='Jelly Bean          | 4.2.x         | API 17'
  aapi_level[18]='Jelly Bean          | 4.3.x         | API 18'
  aapi_level[19]='KitKat              | 4.4 - 4.4.4   | API 19'
} &&
_droid_tools_plugin_init

#
# Function: _droid_tools_plugin_help()
#
# Display the Help for the plugin and the related functions
#
_droid_tools_plugin_help () {
  _mxdf_show_header $BASH_SOURCE

  case "$1" in
    apk ) cat <<__HEREDOC_APK_HELP
TBW!
__HEREDOC_APK_HELP
      ;;

    afwi ) cat <<__HEREDOC_AFWI_HELP
TBW!
__HEREDOC_AFWI_HELP
      ;;

    * ) _describe_component_item $BASH_SOURCE
      ;;
  esac

  _mxdf_show_copyright
}

# --------------------------------------------------------------------------------------------------
#  Aliases Definitions
# --------------------------------------------------------------------------------------------------

alias fastboot='sudo fastboot'
alias fb='fastboot'

