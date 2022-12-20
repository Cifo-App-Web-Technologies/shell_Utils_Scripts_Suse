#! bin/bash

echo'
[global_config]
[keybindings]
[profiles]
  [[default]]
    background_color = "#ffffff"
    cursor_color = "#aaaaaa"
    font = Source Code Pro Medium 13
    foreground_color = "#000000"
    use_system_font = False
  [[zsh]]
    cursor_color = "#aaaaaa"
    font = Source Code Pro Medium 13
    use_system_font = False
  [[bash]]
    cursor_color = "#aaaaaa"
    font = Source Code Pro Medium 13
    use_system_font = False
[layouts]
  [[default]]
    [[[window0]]]
      type = Window
      parent = ""
    [[[child1]]]
      type = Terminal
      parent = window0
[plugins]
' > /home/$puser/.config/terminator/config