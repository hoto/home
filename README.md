# My HOME

Config for Bash, Vim, git and others.

#### Install stuff

    sudo apt install -y vim xclip git imwheel exfat-utils exfat-fuse tree

#### Install Powerline Fonts 

Set `Deja Vu Sand Mono` font in terminal (for vim airline)

    git clone https://github.com/powerline/fonts.git powerline-fonts
    cd powerline-fonts
    sudo bash install.sh

#### Install Vundle for vim

> https://github.com/VundleVim/Vundle.vim

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#### Map Caps Lock to Escape

> http://askubuntu.com/questions/453793/remapping-caps-lock-in-14-04-trusty-tahr/527201#527201

    Startup Applications > Add 
    Name: Disable Capslock 
    Command: setxkbmap -option caps:escape

#### Install exfat for pendrives

> http://askubuntu.com/questions/370398/how-to-get-a-drive-formatted-with-exfat-working

    sudo apt-get install exfat-utils exfat-fuse

### Install imwheel for faster mouse scroll

> http://www.webupd8.org/2015/12/how-to-change-mouse-scroll-wheel-speed.html

    sudo apt-get install imwheel

To change scroll speed edit `~/.imwheelrc`, default value is 3. Then restart `imwheel`:

    killall imwheel
    imwheel
    
Add to startup:

    Startup Applications > Add 
    Name: imwheel for mouse scroll
    Command: imwheel

### Install redshift
From Software Center install redshift.
If you have problems with geolocation run:

  redshift -l list

Then change the geolaction provider in `~/.config/redshift.conf`
