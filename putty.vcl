# Voice commands for putty

#include Unimacro.vch;
include vim.vch;
include vim_plugins.vch;
include screen.vch;
include UNIX_shell.vch;

package install = "sudo apt-get install ";
package remove = "sudo apt-get remove ";
# this assumes you have the magnet linked copied to the clipboard

Add (link | torrent | magnet) = "deluge-console" Wait(20) {enter} Wait(200) 
                                "add " '"' {Shift+Ins} Wait(200) '"' Wait(200)
                                {enter} Wait(200) {ctrl+c} ; 
#deluge-console < add ";
#magnet:?xt=urn:btih:7a505472c03ddd5a8b2903ac070311b7c59fdda2&dn=Match.Of.The.Day.2013.12.21.HDTV.XviD-AFG&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A80&tr=udp%3A%2F%2Ftracker.publicbt.com%3A80&tr=udp%3A%2F%2Ftracker.istole.it%3A6969&tr=udp%3A%2F%2Ftracker.ccc.de%3A80&tr=udp%3A%2F%2Fopen.demonii.com%3A1337"
