#
#  DROID-TOOLS - Android Tools Suite [BASH script version]
#
#  author    Juan J Gonzalez Cardenas [Jota Jota] - <https://github.com/MyXelf/mx-dot-files>
#  version   1.0.0.4
#  date      12.Jan.2014
#
#  legal     Copyright (c) 2012-2014. Licensed under the MIT license.
#

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
    e_em 'Please provide a valid .apk file.'
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

    [ $? -eq $E_FAILURE ] && return $E_FAILURE

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
# Function: dtools()
#
# Display the Help for the plugin and the related functions
#
dtools () {
  _droid_tools_plugin_help
}

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

  echo "A suite of tools to ease the interaction with Android devices. Including the"
  echo "handling of .apk files."
  echo
  echo "TOOLS"
  echo "   _apkv"
  echo "        Returns an array with the relevant information of an .apk file."
  echo "        This function is for internal use only."
  echo
  echo "    apki"
  echo "        Returns the relevant information retrieved from the _apkv() function."
  echo
  echo "    apkr"
  echo "        Renames .apk files. This function will avoid overwriting existing files."
  echo "        There is a template file that will define the output pattern."
  echo "        The template file should be located in $APKR_TEMPLATES"
  echo
  echo "        The possible results are:"
  echo "          D!            - Done!"
  echo "          NTD           - Nothing to Do. Resulting filename is the same as the current one."
  echo "          I/O Error     - Some error, probably renaming the file."
  echo "          Unknown Error - That's it."
  echo

  _mxdf_show_copyright
}

