# Voice commands for gvim

#include Unimacro.vch;
include vim.vch;

File Open = {Alt+f}{Down_3}{enter} Wait(100) {Shift+Tab} Wait(700) {Shift+Tab};
file save as = {Alt+f}{a}{enter};
file save = {Alt+f}{s};
#Directory View = {Shift+Tab};

