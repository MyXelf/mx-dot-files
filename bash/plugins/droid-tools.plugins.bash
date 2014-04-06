#
#  DROID-TOOLS - Android Tools Suite [BASH script version]
#
#  author    Juan J Gonzalez Cardenas [Jota Jota] - <https://github.com/MyXelf/mx-dot-files>
#  version   1.0.0.4
#  date      12.Jan.2014
#
#  legal     Copyright (c) 2012-2014. Licensed under the MIT license.
#


# Define these variables if we are not under the spell of MXDF (and you should)
if [ -z "$MXDF_ACTIVE" ]; then
  E_SUCCESS=0
  E_FAILURE=1
fi

DTOOLS_LABEL="DROID Tools"
DTOOLS_VERSION='1.0.0.3'
DTOOLS_DATE='24.Nov.2013'

# Define the location of the templates for the apkr() function
[ -z "$MXDF_ACTIVE" ] && APKR_TEMPLATES=$HOME/droid-tools.apkr || APKR_TEMPLATES=$MXDF_BASH_LOCAL/droid-tools.apkr

# "Nothing to Do" action return value
ACTION_NTD=2

# The array returning the values from the apkv() function
declare -a -g apkv_return

# Values positions in the returning array
declare -A -g apkv_pos
apkv_pos["label"]=0     # Application Label
apkv_pos["packn"]=1     # Package Name
apkv_pos["vname"]=2     # Version Name
apkv_pos["vcode"]=3     # Version Code

#
# Function: dtools()
#
# Helper function to know everything about the DROID Tools
#
dtools () {
  echo
  echo "$DTOOLS_LABEL v$DTOOLS_VERSION - Android Tools Suite [BASH script version - $DTOOLS_DATE]"
  echo "                       Copyright (c) 2012-2013. Juan J Gonzalez Cardenas [Jota Jota]"
  echo
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
  echo "HOMEPAGE"
  echo "    https://github.com/MyXelf/droid-tools.bash"

  return $E_SUCCESS
}

#
# Function: _apkv()
#
# Return an array with the relevant information of an .apk file. This function
# is for internal use only.
#
_apkv () {
  # Regular Expressions patterns
  local pattern_app="application: label='(.*)' icon="
  local pattern_pkg="package: name='(.*)' versionCode='(.*)' versionName='(.*)'"

  if [ ! -f "$1" ]; then
    echo " Please provide a valid .apk file"
    return $E_FAILURE
  fi

  while read apk_line; do
    case "$apk_line" in
      #
      "application: "* )
        if [[ $apk_line =~ $pattern_app ]]; then
          apkv_return[${apkv_pos["label"]}]=${BASH_REMATCH[1]}
        fi
        ;;

      #
      "package: "* )
        if [[ $apk_line =~ $pattern_pkg ]]; then
          apkv_return[${apkv_pos["packn"]}]=${BASH_REMATCH[1]}
          apkv_return[${apkv_pos["vname"]}]=${BASH_REMATCH[3]}
          apkv_return[${apkv_pos["vcode"]}]=${BASH_REMATCH[2]}
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
  echo "$DTOOLS_LABEL :: APK Information Script"
  echo

  local apk_file

  for apk_file in "$@"; do
    _apkv "$apk_file"

    [ $? -eq $E_FAILURE ] && return $E_FAILURE

    echo "# File Name    = $apk_file"
    echo "> Application  : ${apkv_return[${apkv_pos['label']}]}"
    echo "> Package Name : ${apkv_return[${apkv_pos["packn"]}]}"
    echo "> Version Name : ${apkv_return[${apkv_pos["vname"]}]}"
    echo "> Version Code : ${apkv_return[${apkv_pos["vcode"]}]}"
    echo
  done

  return $E_SUCCESS
}

#
# Function: apkr()
#
# Renames .apk files
#
apkr () {
  echo "$DTOOLS_LABEL :: APK Renamer Script"
  echo

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

    # Conform the initial filename and lowercase it
    apk_filename=${filename_prefix}.apk
    filename_suffix=
    action="Done!"

    # Determine the needed suffix to avoid clashing with already existent files
    while [ -f "$apk_filename" ]; do
      [ "$apk_file" = "$apk_filename" ] && action=$ACTION_NTD && break
      let filename_suffix--
      apk_filename=${filename_prefix}${filename_suffix}.apk
    done

    echo -n "> ${apk_file} = ${apk_filename}${xtra} ... "

    if [ "$action" != "$ACTION_NTD" ]; then
      mv "$apk_file" "$apk_filename" > /dev/null 2>&1
      action=$?
    fi

    # Output the result of the operation
    case $action in
      $ACTION_NTD )
        echo "NTD"
        ;;

      $E_SUCCESS )
        echo "D!"
        ;;

      $E_FAILURE )
        echo "I/O Error"
        ;;

      * )
        echo "Unknown Error"
        ;;
    esac
  done

  return $action
}

