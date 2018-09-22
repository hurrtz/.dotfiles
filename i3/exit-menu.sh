#!/bin/fish

begin
  set res (rofi -lines 5 -dmenu < /home/hurrtz/.config/i3/dmenu-i3exit)

  switch $res
    case '*ock'
      i3lock-fancy -p

    case '*xit'
      i3-msg exit

    case '*leep'
      systemctl hibernate -i

    case '*eboot'
      systemctl reboot

    case '*oweroff'
      systemctl poweroff
  end
end

