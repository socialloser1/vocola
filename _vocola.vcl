## Global voice commands

#  When overriding ensure commands have the same case and spelling
#  overrid in application-specific command files

### Switch applications, windows, and panels

Switch Window                        = SendSystemKeys( {Alt+Tab} );
Copy and Switch                      = {Ctrl+a}{Ctrl+c} SendSystemKeys( {Alt+Tab} );
Copy to (NatSpeak|Emacs|Composition) = {Ctrl+a}{Ctrl+c} HeardWord(switch,to,$1);
Close Here                           = ButtonClick(2,1) Wait(100) c;
Close Prompt                         = {Alt+Space}c;
Context Menu                         = {Alt+f}{Down};
# implemented elsewhere
#Close Window                        = {Alt+Space}c;
#Switch to Browser                   = AppBringUp(chrome);


(Switch|Next) View     = {Ctrl+Tab};
(Switch|Next) View <n> = {Ctrl+Tab_$2};
Previous View          = {Ctrl+Shift+Tab};
Previous View <n>      = {Ctrl+Shift+Tab_$1};

Back Tab      = {Shift+Tab};
Back Tab  <n> = {Shift+Tab_$1};
Page          = {PgDn};
Page <n>      = {PgDn_$1};
#Escape        = {Esc};

### use extension keyhold (Keys)

(hold|release) (shift|control=ctrl|tab|alt) button = Keys.SendInput({$2_$1});

# Open/Close a drop-down list
(Expand={Alt+ExtDown} | Collapse={Alt+ExtUp}) That = SendSystemKeys($1);

### NatSpeak

Dragon Menu              = SendSystemKeys( {NumKey*} );
(Edit=v | Train=t) Words = SendSystemKeys( {NumKey*} ) Wait(100) w $1;
Save Speech Files        = SendSystemKeys( {NumKey*} ) Wait(100) ff;
Exit NatSpeak            = SendSystemKeys( {NumKey*} ) Wait(100) e;
Die Die = GoToSleep();

#
# IE
##
#[search] Google for <_anything> = AppBringUp("IEXPLORE") {Alt+g}$1{Enter} ;

# ---------------------------------------------------------------------------
# Mouse Handling

Hit Down         = ButtonClick();
Hit Double       = ButtonClick(1,2);
(Shift           = 1 | Control                   = 2 | Alt = 3) Click = ShiftKey($1) ButtonClick();
Hit Start [Menu] = SendSystemKeys( {Ctrl+Esc} );

## Straight mouse grid commands. (See documentation in utilities.vch)

include utilities.vch;
<n> := 0..30;

<n> <n> Go    = moveTo($2, $1);
<n> <n> Touch =  touch($2, $1);
<n> <n> Drag  = dragTo($2, $1);
#<n> <n> Paste =  touch($2, $1) {Ctrl+v};

<upDown>    := (  Up='-' |  Down='');
<leftRight> := (Left='-' | Right='');

Drag <n> <upDown>    = dragBy(0, $2$1);
Drag <n> <leftRight> = dragBy($2$1, 0);

# extension of mouse movement commands for greater range
<mouse_range_adjust> := (20|30|40|50|60|70|80|90);
# adjust pixel movement to seem more like the built-in "move mouse" grammars
Mouse <upDown> <mouse_range_adjust>    = moveBy(0, $1 Eval($2/5));
Mouse <leftRight> <mouse_range_adjust> = moveBy($1 Eval($2/5), 0);

### Move and resize windows
<ns> := 0..10;
Window move <direction> = SendSystemKeys({Win+$1});
Window move <direction> <ns> = Repeat($2, SendSystemKeys({Win+$1}));
Window maximise (swap | left | right) = SendSystemKeys({Win+Up}) 
    Repeat(2, SendSystemKeys({Win+Right})) SendSystemKeys({Win+Up});
#<edge> := (Top=n | Bottom=s | Left=w | Right=e);
#
#[Move] Window <n> <upDown>    = moveNearEdge(n,0,1) dragBy(0, $2$1);
#[Move] Window <n> <leftRight> = moveNearEdge(n,0,1) dragBy($2$1, 0);
#[Move] Window Northwest = moveNearEdge(nw,2,1) dragTo(2,1);
#[Move] Window Northeast = moveNearEdge(ne,-5,1) dragTo(95,1);
#
#[Size] Window <edge> <n> <upDown>    = moveToEdge($1) dragBy(0, $3$2);
#[Size] Window <edge> <n> <leftRight> = moveToEdge($1) dragBy($3$2, 0);
#
## implemented elsewhere
##Maximize Window = touchNearEdge(ne,-2,1);
#
#Tile Windows     = tileWindows(0);
#Tile Windows <n> = tileWindows($1);  # Edge is <n> units right of center

# ---------------------------------------------------------------------------
# Text Editing

<direction>  := Left | Right | Up | Down;
<left_right> := Left | Right;
<start_end> := (Start={Home} | End={End});
<compass> := (North={Shift+Ctrl+Home} | South={Shift+Ctrl+End} |
 East={Shift+End} | West={Shift+Home});

### Characters
# implemented elsewhere
#<n> <direction>       = {$2_$1};
Kill (Char | 1 | One) = {Del};
Kill Back [1]         = {Backspace};
Kill <n>              = {Del_$1};
[Kill] Back <n>       = {Backspace_$1};

### Words
[One] Word <left_right>= {Ctrl+$1};
<n> Words <left_right> = {Ctrl+$2_$1};
Kill Word              = {Right_2}{Ctrl+Left}{Shift+Ctrl+Right}   {Del};
Kill <n> Words         = {Right_2}{Ctrl+Left}{Shift+Ctrl+Right_$1}{Del};
Kill Back Word         = {Left}{Ctrl+Right}{Shift+Ctrl+Left}   {Del};
Kill Back <n> Words    = {Left}{Ctrl+Right}{Shift+Ctrl+Left_$1}{Del};

### Lines
Line <start_end>     = $1;
# implemented elsewhere
#New Line             = {Enter};
Line Here            = {Enter}{Left};
Copy Line            = {home}{Shift+End}{Ctrl+c};
Kill Line            = {home}{Shift+End}{Del};
Kill Back Line       = {home}{Shift+Up}  {Shift+Home}{Del};
Kill <n> Lines       = {home}{Shift+Down_$1}{Shift+Home}{Del};
Kill Back <n> Lines  = {home}{Shift+Up_$1}  {Shift+Home}{Del};
Kill Here            = {Shift+End}{Del};
Kill Back Here       = {Shift+Home}{Del};
Duplicate Line       = {home}{Shift+Down}{Shift+Home}{Ctrl+c}{Home}{Ctrl+v};
                    
### Paragraphs        
Graph Start          = {Ctrl+Up}{Right}{Home};
Graph End            = {Ctrl+Down}{Left_2}{End};
(Paragraph|Graph) Here = {Enter}{Enter}{Left}{Left};
Open (Graph|Line)    = {Enter}{Enter}{Left};
Copy Graph           = {Ctrl+Down}{Shift+Ctrl+Up}{Ctrl+c};
Kill Graph           = {Ctrl+Down}{Shift+Ctrl+Up}{Del};
Duplicate Graph      = {Ctrl+Down}{Shift+Ctrl+Up}{Ctrl+c}{Home}{Ctrl+v};
                    
### Entire "Flow"   
Flow Start           = {Ctrl+Home};
Flow End             = {Ctrl+End};
#New Line             = {Enter};
All           = {Ctrl+a};
Copy All             = {Ctrl+a}{Ctrl+c};
(Cut|Kill) All       = {Ctrl+a}{Ctrl+x};
Kill Flow Here       = {Ctrl+Shift+End} {Ctrl+x};
Kill Back Flow Here  = {Ctrl+Shift+Home}{Ctrl+x};
Replace All          = {Ctrl+a}{Del}{Ctrl+v};
                    
### Selection         
Kill That            = {Del};
# implemented elsewhere
#Cut That             = {Ctrl+x};
#Copy That            = {Ctrl+c};
Yank That            = {Ctrl+v};
Paste Here           = ButtonClick() {Ctrl+v};
Duplicate That       = {Ctrl+c}{Left}{Ctrl+v};
Keep That            = {Ctrl+c}{Ctrl+a}{Del}{Ctrl+v};
Select <compass>     = $1;

### Miscellaneous
undo that <n> = {Ctrl+z_$1};
Camel [Case] That = HeardWord(\Cap,That) HeardWord(compound,that) {Ctrl+Left}
                    {Shift+Right} HeardWord(\No-Caps,That){Ctrl+Right};
(Cap | Up Case) <n> = {Shift+Right_$2} HeardWord(\All-Caps,That);

include keys.vch;

# ---------------------------------------------------------------------------
# Commands for Windows 2000 (that work differently under Windows XP)

Recent Documents = SendSystemKeys({Ctrl+Esc}) {Up_6}{Right};
Run Program      = SendSystemKeys({Ctrl+Esc}) {Up_2}{Enter};

Environment Variables = 
    AppBringUp("C:\WINNT\System32\SYSDM.CPL") # Control Panel "System"
    {Shift+Tab}{Right_4}{Alt+e};              # "Advanced" tab, "Env..." button

# Taskbar commands

taskBar()   := SendSystemKeys({Ctrl+Esc}) {Esc}{Tab_2};
launchBar() := SendSystemKeys({Ctrl+Esc}) {Esc}{Tab};
<1to20> := 1..20;
<launch_actions> := (Launch=" "  | launch Close=" {Alt+f4}");
#<launch_actions> <1to20> = launchBar() {Down_$2}{Up} $1;
<launch_actions> <1to20> [(from bottom)] [1..6 times] = When($4, Repeat($4, launchBar() When($3, {Up_$2}, {Down_$2}{Up}) $1), launchBar() When($3, {Up_$2}, {Down_$2}{Up}) $1);
# launch close multiple consecutive taskbar items

#Switch to <1to20> [Right] = taskBar() {Right_20}{Left_$1}{Right} " ";
# interference
#Close     <1to20> [Right] = taskBar() {Right_20}{Left_$1}{Right} " " {Alt+F4};
#Switch to <1to20> Left    = taskBar() {Right_$1} " ";
#Close     <1to20> Left    = taskBar() {Right_$1} " " {Alt+F4};

#<from_bottom> := (from bottom=Up | ""=Down);
#<from_bottom> := (<0to20> from bottom={Up_$1} | <1to20>={Down_$1}{Up});
#Launch <from_bottom> = launchBar() $1;
#Launch Bar = launchBar();

# ---------------------------------------------------------------------------
# Context-Sensitive Commands

#include folders.vch;

### Commands for "file browse" dialog boxes

#Open | New | Save | File | Attachment | Browse | Directory:
#  Folder <folder> = {Ctrl+c}$1\{Enter};
#  Go Up = ..{Enter};
#  Go Up <n> = Repeat($1, ..\) {Enter};


#
# Tan custom commands

# bring up Control Panel main menu, select from start menu using directional keys
# rather than typing because timing is more reliable
controlPanel() := SendSystemKeys({Win}) {Right} {Up_4} {enter}
                  WaitForWindow("*Control Panel*","", 7000);
# selects sound option from Control Panel main menu, select first item beginning
# with "s". long wait after bringing up Control Panel to allow items to display.
soundControl() := 
    controlPanel() Wait(1000) {s} {enter} WaitForWindow("Sound","",7000);

# bring up volume control of the specified device
levelAdjust(deviceindex) := soundControl() {Down_$deviceindex} {Alt+p} {Ctrl+Tab};

<sound_device> := (headset=1 | Bluetooth=2 | car=2 | laptop=3);
<up_down> := (Up="Right" | Down="Left");
<adjust_amount> := (tiny=2 | small=5 | medium=10 | large=20 | massive=40);

Control Panel           = controlPanel();
Sound controls          = soundControl();
Sound to <sound_device> = soundControl() {Down_$1} {Alt+s} Repeat(2, {Alt+f4});
volume <up_down> <adjust_amount> <sound_device> = levelAdjust($3) {$1_$2}
                                                  Repeat(3, {Alt+f4});
volume (mute | unmute) <sound_device> = levelAdjust($2) {Tab} {Space}
                                        Repeat(3, {Alt+f4});

#soundControl() Wait(500) {Down_$3} 
#volume <up_down> <sound_device> = soundControl() Wait(500) {down_$2}
                                           #Wait(50) {Alt+p} Wait(50) {Ctrl+Tab} {$1_$2}
                                           #Repeat(3, {Alt+f4} Wait(100));

deviceControl() := 
    controlPanel() Wait(1000) "dev" {right} {enter} WaitForWindow("Devices and Printers","",2000);

massStorageEject() :=
    deviceControl() Wait(2000) "Mass"  {Alt+f} {e};


Device control      = deviceControl();
eject mass storage = massStorageEject();

# ---------------------------------------------------------------------------
# global text shortcuts

(vim | bash) config                   = ".$1rc";
Short date separator = "----{enter}14" Repeat(2,{Left});
python extension = ".py ";
insert signature = "{enter}{enter}Regards,{enter} -- Tom --";
text website watch series = http://watchseries.lt/serie/game_of_thrones;

