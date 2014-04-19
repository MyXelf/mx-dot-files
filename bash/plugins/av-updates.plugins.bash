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
# Interface to the 'Antivirus Updates Helper'
#
av () {
  case "$1" in
    # Display information about the found updates
    "" )
      e_hr 'Antivirus Updates' 'Information' '\n'

      IFS=$'\n'
      local ufile uversion platform ufound

      # NOD32
      for ufile in $(find -type f -name 'update.ver' -printf '%P\n' | sort -s); do
        uversion=$(grep '^version=' $ufile | sort -r --key=2.3,2.10 --key=1.9,1.12 | head -1 | cut -d= -f2 | tr '()' '[]')
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
      _av_updates_plugin_help
      ;;
  esac
}

#
# Function: _av_updates_plugin_help()
#
# Display the Help for the plugin and the related functions
#
_av_updates_plugin_help () {
  _mxdf_show_header $BASH_SOURCE

  echo "av-updates is capable of ..."

  _mxdf_show_copyright
}

