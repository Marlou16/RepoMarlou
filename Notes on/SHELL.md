## Notes on Course 1. Linux Command Line Basics

* The VM does have Python 2.7.6 installed :)
* We can use several terminals (in Windows Git Bash for example) to log into the VM
* When having a ' in a command (by typing plain Marlou's course)   
  the command line waits until the next ' is typed (which is very logical)
* `ls` is short for _list_, did you know?
* `lsusb` gives you all recognized usb devices
* `./` actually means 'execute'
* `sudo !!` means that you want to execute the previous command as sudo.
* A cool 'Course' program is `cowsay`  
    -> `apt-get/yum install cowsay`  
    -> `cowsay <str>`
* Shortly, one can remember that the terminal uses a shell, by default (GNU) Bash,  
  others: **Bourne shell** (sh), **C shell** (csh), **Korn shell** (ksh), **Z shell** (zsh)
* The `host` command is a handy interface to the DNS (which a.o. gives the IP adress)
* `history` gives you the last 15 commands. (or more!)
* `rm <weirdfile.txt>` you can also do in **Python** via `>>> os.remove('weirdfile.txt')`


* `cat` is your go-to command to read short (.txt) files.  
  (`cat` is short for _concatenate_, you can also argument more than one file)
* analyzing commands are `wc` (one argument) and `diff` (two arguments)  
  in the `diff` output the < or > points to the file which contains the change
* `man <command>` gives the manual page for the <command> (try it for `cowsay` or `ls`)
* if you want the pinguin in cowsay, use the '-f tux' option
* `stdin` stands for standard input, and `stdout` for standard output! WOW!
* `bc` gives you a calculator. You exit via _Ctrl+D_ or `quit`
* _Ctrl+D_ stands for 'End of File (EOF)', did you know?
* Large files you can read via the `less <filename>` command, where:  
    -> `D` (or _spacebar_) scrolls down one page  
    -> `U` scrolls up one page  
    -> `>` skips to the last line of the file, while `<` ships to the first line  
    -> typing the _linenumber_ brings you to this linenumber (handy on sourcecode)  
    -> `/<str>` let's you search for the <str>, you can use _regular expressions_ here  
    .  -> Search is capital sensitive!  
    .  -> `n` gives you the next occurence  
    .  -> `N` gives you the previous occurence  
    .  -> `q` let's you leave the document  
* Note that these commands also kind of work in **vim** and **nano** :),   
  which are terminal based editors.  
* `^X` actually means _Ctrl+X_


* Windows uses on default the `\` to seperate folders, while all others use `/`,   
  and the `\` is the _escape character_
* `/` is the root directory and `~/` is your home directory
* `pwd` command means print working directory. (_cwd_ means current working directory!)
* `cd` means change directory. OMG, never thought of it!
* never forget `mv` (also for renaming), `cp`, `creat` (`open`) and `mkdir`, `rmdir` 
* `rmdir` is only possible on empty dir, removing a dir incl contents, use `rm -r <dirname>`
* you can give a pattern to `ls` to list all found results following the pattern
  i.e. `ls *png` gives you all .png files :) <- this is called **GLOBBING** (`man glob`)
