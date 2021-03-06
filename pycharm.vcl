# Voice commands for pycharm
include Unimacro.vch;
include vim.vch;
include UNIX_shell.vch;
include keys.vch;

menu (show=hold|select=release) [0..9] = $2 Wait(200) Keys.SendInput({ctrl_$1}{tab_$1});
#menu (show=hold|select=release) = Keys.SendInput({ctrl_$1}) Wait(500) {tab};
##    Keys.SendInput({ctrl_release});


### frequently used ###
update [(from|to)] (version control="#"|default="p") = {ctrl+alt+shift+$2};
#compare [file] with = {ctrl+alt+shift+f2};
commit [to] version control = {ctrl+alt+k};
(next=Right|previous=Left) 1..9 = Repeat($2, {Alt+$1} Wait(200)) {esc};

#screen splitting
(switch=n|close=x) split = {ctrl+w} $1;
# compatible alias for vim command
vim window (right|left|switch) = {ctrl+w}"n";
#[(charm|window)] split vertical={ctrl+shift+\};
#split tools={shift+\};

### Navigation ###
go to (
    class = {Ctrl+n}|
    file = {Ctrl+Shift+n}|
    file structure = {Ctrl+Alt+Shift+s}|
    project settings = {Ctrl+Alt+Shift+s}|
    symbol = {Ctrl+Alt+Shift+n}|
    declaration = {Ctrl+b}|
    implementation = {Ctrl+Alt+b}|
    type declaration = {Ctrl+Shift+b}|
    usages = {Ctrl+Alt+F7}|
    action={ctrl+shift+a}
) = {esc} $1;
return from jump = {ctrl+u};
symbol preview = {ctrl+y};

version control popup = {Alt+`} Wait(200) {esc};
Recent files popup = {Ctrl+shift+e};
File structure popup = {Ctrl+F12};
File structure view = {Alt+7};
(project=1|structure=7) view = {alt+$1};
Show navigation bar = {Alt+Home};
quick definition lookup = {Ctrl+Shift+i};

#TODO FIX
charm Switch tab [1..9] = When($1, {Ctrl+Tab_$1}, {ctrl+tab});
Charm back change = {Ctrl+Shift+Backspace};
Select current file or symbol = {Alt+F1};

Toggle bookmark = {F11};
Toggle bookmark with mnemonic = {Ctrl+Shift+F11};
Go to numbered bookmark 0..9 = {Ctrl+$1};
Show bookmarks = {Shift+F11};

### Usage Search ###
Find usages = {Alt+f7};
Find usages in file = {Ctrl+F7};
Highlight usages in file = {Ctrl+Shift+F7};
Rename = {Shift+F6};

charm (
    settings={ctrl+shift+f11}|
    run console={ctrl+shift+f2}|
    manage tasks={ctrl+shift+","}|
    last tool={f12}|
    list tools={alt+Down}|
    run program={shift+f10}
) = $1;

charm show tool 0..9 = {Alt+$1};
Hide window = {Shift+Esc};
(show|hide) (all=a|side=s) (tools|windows) = {Ctrl+Shift+F12} {ctrl+$2};
(tool="shift+"|window=) close = {ctrl+$1f4};

### editing ###
Show possible actions = {Alt+Enter} Wait(200) {esc};
complete = {ctrl+" "};
Show error description = {Ctrl+F1};

(expand="="|collapse="-") [(all="+shift")] = {ctrl$2+$1}; #}>(all="shift+"|line) = {ctrl+$2$1};
comment line = Wait(200) {ctrl+"/"};
(indent=">" Wait(200) ">"|auto indent=alt+i|comment="/") [the] next 1..20 lines = Repeat($2, Wait(200) {ctrl+$1});

surround with = {ctrl+alt+t};
(replace normal="ctrl+alt+shift+r"|find in path="ctrl+shift+F"|replace in path="ctrl+shift+R"|structure find=|structure replace=) = {$1};

Select successively increasing code blocks = {Ctrl+w};
Decrease current selection to previous state = {Ctrl+Shift+w};
Select till code block (end="]"|start="[") = {Ctrl+Shift+$1};

Save all = {Ctrl+s};
Inspect file = {Alt+Shift+i};
Optimize imports = {Ctrl+Alt+o};


### Running ###
Select configuration and run = {Alt+Shift+F10};
Select configuration and debug = {Alt+Shift+F9};
Run context configuration from editor = {Ctrl+Shift+F10};
Resume = {F9};
(Step={F8}|into={F7}) [1..20] [times] = When($2, Repeat($2, Wait(200) $1), $1);
Toggle breakpoint = {Ctrl+F8};
Step out = {Shift+F8};
Run to cursor = {Alt+F9};
Evaluate expression = {Alt+F8};
Quick evaluate expression = {Ctrl+Alt+F8};
View breakpoints = {Ctrl+Shift+F8};

### end of frequently used ###

#to super-method/super-class = {Ctrl+u};
Go to (previous=Up|next=Down) method = {Alt+$1};
Move to code block (end="]"|start="[") = {Ctrl+$1};
Type hierarchy = {Ctrl+h};
Method hierarchy = {Ctrl+Shift+h};
Call hierarchy = {Ctrl+Alt+h};
(Next=f2|previous="shift+f2") highlighted error = {$1};
#Edit source / View source = {F4 / Ctrl+Enter};

### Refactoring ###
Safe Delete = {Alt+Delete};
Change Signature = {Ctrl+F6};
Inline = {Ctrl+Alt+n};
Extract (Method=M|Variable=V|Field=F|Constant=C|Parameter=P) = {Ctrl+Alt+$1};

### General ###
#Synchronize = {Ctrl+Alt+y};
Add to Favorites = {Alt+Shift+f};
Quick switch current scheme = {Ctrl+"`"};
add item = {alt+insert};
search everywhere = {shift}{shift};
clean compile files = {ctrl+shift+"#"};
#Charm Tab (back=Left|next=Right) = {Ctrl+Alt+$1};

### Editing ###
Complete statement = {Ctrl+Shift+Enter};
Parameter info = {Ctrl+p};
Quick documentation lookup = {Ctrl+q};
External Doc = {Shift+F1};
Generate code = {Alt+Insert};
Override methods = {Ctrl+o};
Reformat code = {Ctrl+Alt+l};
Auto indent line = {Ctrl+Alt+i};
Copy to clipboard = {Ctrl+c};
Paste from clipboard = {Ctrl+v};
Paste from recent buffers = {Ctrl+Shift+v};
Duplicate current line or selected block = {Ctrl+d};
Smart line split = {Ctrl+Enter};
Toggle case for word at caret or selected block = {Ctrl+Shift+u};

### Search/Replace ###
find [(this="ctrl+"|next=|back="shift+")] = When($1,{$1f3},{alt+f3});
select (next="alt+"|all="ctrl+alt+"|unselect="shift+alt+") = {$1j};

### VCS/Local History
Commit project to VCS = {Ctrl+k};
Update project from VCS = {Ctrl+t};
View recent changes = {Alt+Shift+c};
quick popup = {Alt+"`"}; #BackQuote (`)  ‘VCS’ quick popup

### +Live Templates+ i##
Surround with Live Template = {Ctrl+Alt+j};
Insert Live Template = {Ctrl+j};

### action a specific line ###
$set numbers 0;
GotoLineModcharm(line, mod) := {Esc}"mv" ":" Wait(200) "$line"{enter} Wait(200) "$mod" "zz"; 
GotoLine4Modcharm(thousands, hundreds, tens, ones, mod) :=
    GotoLineModcharm(Eval($thousands*1000 + $hundreds*100 + $tens*10 + $ones), $mod);
<line_modcharm> := (
    expand={ctrl+"="}  | collapse={ctrl+"-"} |
    comment={ctrl+"/"} | auto indent={ctrl+alt+i} 
);
charm line [<line_modcharm>] <0to9>                      = GotoLineModcharm($2,$1);
charm line [<line_modcharm>] <0to9> <0to9>               = GotoLine4Modcharm(0, 0, $2, $3, $1);
charm line [<line_modcharm>] <0to9> <0to9> <0to9>        = GotoLine4Modcharm(0, $2, $3, $4, $1);
charm line [<line_modcharm>] <0to9> <0to9> <0to9> <0to9> = GotoLine4Modcharm($2, $3, $4, $5, $1);
