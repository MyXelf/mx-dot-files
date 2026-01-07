#
#  AV-UPDATES - Antivirus Updates Helper [BASH script version]
#
#  author    Juan J González Cárdenas [Jota Jota] - <https://github.com/MyXelf/mx-dot-files>
#  version   1.0.0.1
#  date      08.May.2015
#
#  legal     Copyright © 2014-2026. Licensed under the MIT license.
#

#
# Function: av()
#
# Handle the common operations on the known Antivirus Updates files
#
av () {
  # Process command line options
  case "$1" in
    --info | -i | '' )
      local opt_info=1
      local ehr_title='Information'
      ;;

    --rename | -r )
      local opt_rename=1
      local ehr_title='Rename Tool'
      ;;

    --help | -h )
      _av_updates_plugin_help $FUNCNAME
      return $E_SUCCESS
      ;;

    * )
      e_em "Unknown parameter in command line: $@\n       Try '$FUNCNAME --help' for more information."
      return $E_FAILURE
      ;;
  esac

  # Available AV Engines. Declare all the engines to be processed
  local av_engines=( nod kav )

  # AV Engine: NOD32
  local engine_nod_idxfile='update.ver'
  local engine_nod_product='NOD32'
  local engine_nod_version="command grep '^version='  \$ufile | sort --key=1.9,1nr --key=2.3,2.10r | head -1 | cut -d= -f2 | tr '()' '[]' | tr -d '\r'"
  local engine_nod_platfrm="command grep '^platform=' \$ufile | sort -u | cut -d= -f2 | tr '\n' '.' | tr -d '\r'"
  local engine_nod_dformat="nod32-update \$uversion"

  # AV Engine: Kaspersky
  local engine_kav_idxfile='index/u0607g.xml'
  local engine_kav_product='KAV'
  local engine_kav_version="command grep -m1 'UpdateDate=' \$ufile | sed -re 's/.*([0-9]{2})([0-9]{2})([0-9]{4}) ([0-9]{4}).*/\3\2\1-\4/'"
  local engine_kav_platfrm=''
  local engine_kav_dformat="kav-update [\${uversion}]"

  e_hr 'Antivirus Updates' $ehr_title '\n'

  local engine ufile product uversion platform ufound action IFS=$'\n'
  local ivar_idxfile ivar_product ivar_version ivar_platfrm ivar_dformat

  # "Nothing to Do" action return value
  local ACTION_NTD=2

  # Cycle thru all the previously declared AV Engines
  for engine in "${av_engines[@]}"; do
    # Use indirect variables to reference the variables of the current engine
    ivar_idxfile=engine_${engine}_idxfile
    ivar_product=engine_${engine}_product
    ivar_version=engine_${engine}_version
    ivar_platfrm=engine_${engine}_platfrm
    ivar_dformat=engine_${engine}_dformat

    for ufile in $(find -type f -path "*/*/${!ivar_idxfile}" -printf '%P\n' 2>/dev/null | sort -s); do
      product=${!ivar_product}
      uversion=$(eval ${!ivar_version})
      platform=$(eval ${!ivar_platfrm})
      ufound=1

      # Option: Information
      if [ -n "$opt_info" ]; then
        e_cm "Update File = $ufile"
        e_ac "AV Engine   : ${product} ${platform}"
        e_ac "DB Version  : ${I_YELLOW}${uversion}${R_COLOR}\n"
      fi

      # Option: Rename
      if [ -n "$opt_rename" ]; then
        local source_dir=${ufile%/${!ivar_idxfile}}
        local target_dir=$(dirname $source_dir)/$(eval echo ${!ivar_dformat})
        target_dir=${target_dir#./}

        local action=$ACTION_NTD

        e_ac -n "${I_GRAY}${product}${R_COLOR}" \'${source_dir}\' "${WHITE}->${R_COLOR}" \'${target_dir}\' "${WHITE}...${R_COLOR} "

        if [ "$source_dir" != "$target_dir" ]; then
          mv "$source_dir" "$target_dir" &>/dev/null
          action=$?
        fi

        # Output the result of the operation
        case "$action" in
          $ACTION_NTD ) e_hc "${I_GRAY}NTD${R_COLOR}" ;;
          $E_SUCCESS  ) e_hc "${I_YELLOW}D!${R_COLOR}" ;;
          $E_FAILURE  ) echo 'I/O Error' ;;
          *           ) echo 'Unknown Error' ;;
        esac
      fi
    done
  done

  [ -z "$ufound" ] && e_dm 'No Updates Found' || return $E_SUCCESS
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

