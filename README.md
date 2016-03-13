# My HOME

Config for Bash, Vim, git and others.

#### Install Vundle

>https://github.com/VundleVim/Vundle.vim

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#### Map Caps Lock to Escape

>http://askubuntu.com/questions/453793/remapping-caps-lock-in-14-04-trusty-tahr/527201#527201

    Startup Applications > Add > Name: Disable Capslock > Command

    setxkbmap -option caps:escape

#### Install Powerline Fonts 

Use Defa Vu Sand Mono in terminal (for vim airline)

    https://github.com/powerline/fonts


#### Install exfat for pendrives

>http://askubuntu.com/questions/370398/how-to-get-a-drive-formatted-with-exfat-working

    sudo apt-get install exfat-utils exfat-fuse

#### Change hostname to something shorter

>http://www.howtogeek.com/197934/how-to-change-your-hostname-computer-name-on-ubuntu-linux/

    sudo vim /etc/hostname
    sudo vim /etc/hosts
