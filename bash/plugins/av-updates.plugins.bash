#
#  AV-UPDATES - Antivirus Updates Helper [BASH script version]
#
#  author    Juan J Gonzalez Cardenas [Jota Jota] - <https://github.com/MyXelf/mx-dot-files>
#  version   1.0.0.0
#  date      09.Mar.2014
#
#  legal     Copyright (c) 2014. Licensed under the MIT license.
#

#
# Function: av()
#
# Handle the common operations on the known Antivirus Updates files
#
av () {
  # Process command line options
  case "$1" in
    # Display information about the found updates
    "" )
      e_hr 'Antivirus Updates' 'Information' '\n'

      IFS=$'\n'
      local ufile uversion platform ufound

      # NOD32
      for ufile in $(find -type f -name 'update.ver' -printf '%P\n' | sort -s); do
        uversion=$(grep '^version=' $ufile | sort -r --key=2.3,2.10 --key=1.9,1.12n | head -1 | cut -d= -f2 | tr '()' '[]')
        platform=$(grep '^platform=' $ufile | sort -u | cut -d= -f2 | tr '\r\n' '\0.')
        ufound=1

        e_cm "Update File = $ufile"
        e_ac "Application : NOD32 .${platform}"
        e_ac "DB Version  : ${I_YELLOW}${uversion}${R_COLOR}\n"
      done

      # Kaspersky
      for ufile in $(find -type f -path '*/index/u0607g.xml' -printf '%P\n' | sort -s); do
        uversion=$(grep -m1 'UpdateDate=' $ufile | sed -re 's/.*"([0-9]{2})([0-9]{2})([0-9]{4}) ([0-9]{4}).*"/\3\2\1-\4/')
        ufound=1

        e_cm "Update File = $ufile"
        e_ac "Application : Kaspersky"
        e_ac "DB Version  : ${I_YELLOW}${uversion}${R_COLOR}\n"
      done

      [ -z "$ufound" ] && e_dm 'No Updates Found'
      ;;

    # The Help
    --help | -h )
      _av_updates_plugin_help $FUNCNAME
      ;;
  esac
}

# --------------------------------------------------------------------------------------------------
#  Base Functions
# --------------------------------------------------------------------------------------------------

#
# Function: _av_updates_plugin_help()
#
# Display the Help for the plugin and the related functions
#
_av_updates_plugin_help () {
  _mxdf_show_header $BASH_SOURCE

  case "$1" in
    av ) cat <<__HEREDOC_AV_HELP
$1 is meant to ease the process of dealing with everyday offline Antivirus
updates by providing information that can be handy and not obvious by simple
eye inspection.

The reported data will vary, depending on the information provided by the AV
engine in question, but will always include the AV engine name and the version
of the updates files.

$1 works at the containing folder level meaning that invoking it from inside
the updates directory will report '- No Updates Found -'. If in doubt go up one
level in the directory hierarchy and execute the command again.

$1 will descend through the directory tree of the current working directory, so
it can be used to quickly spot AV updates contained inside huge applications
repositories or an entire partition if desired.

Usage:
  $1 [<option>]

  When no <option> specified, same as --info (-i)

Options:
  -i, --info      print information about the found AV updates
  -r, --rename    rename the container folders of the available AV engines
  -h, --help      print this help message and exit
__HEREDOC_AV_HELP
      ;;

    * ) _describe_component_item $BASH_SOURCE
      ;;
  esac

  _mxdf_show_copyright
}

