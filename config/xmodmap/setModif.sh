xmodmap -e 'keycode 66 = Mode_switch' # Block Mayus as mode switch
xmodmap -e 'keycode 135 = Caps_Lock NoSymbol Caps_Lock NoSymbol Caps_Lock' # LeftClick as block mayus
xmodmap -e 'keycode 107 = Caps_Lock NoSymbol Caps_Lock NoSymbol Caps_Lock' # ImprPant as block mayus

#jklñ
xmodmap -e 'keycode  45 = k K Down Down lstroke Lstroke lstroke'
xmodmap -e 'keycode  44 = j J Left Left ssharp section ssharp'
xmodmap -e 'keycode  46 = l L Up Up eth ETH eth'
xmodmap -e 'keycode  47 = ntilde Ntilde Right Right asciitilde dead_doubleacute asciitilde dead_doubleacute ntilde Ntilde asciitilde dead_doubleacute'

#<> on , and . with mode switch
xmodmap -e 'keycode 59 = comma semicolon less semicolon horizconnector multiply horizconnector'
xmodmap -e 'keycode 60 = period colon greater colon periodcentered division periodcentered'
