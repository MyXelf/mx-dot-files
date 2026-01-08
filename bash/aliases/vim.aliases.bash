# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# vim.aliases.bash (MXDF::BASH)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# GVim
v () { [ -n "$1" ] && gvim --servername 'GVim-One' --role 'gvim-one' --remote-tab-silent "$@" || (gvim --servername 'GVim-One' --remote-send '<C-\><C-N>:call foreground() | echo "GVim Window: Activated"<CR>' &>/dev/null || gvim --servername 'GVim-One' --role 'gvim-one'); }

