# laptop_setup
Mac Laptop setup

# Common requirements
- Firefox (version 46.0.1) https://ftp.mozilla.org/pub/firefox/releases/
- Chrome (https://www.google.com/chrome/)
- Xcode (via the app store, make sure you run it and accept the license agreement aswell!)
- Sublime text 3 or Atom (https://www.sublimetext.com/3) (https://atom.io/)
- Iterm2 (https://www.iterm2.com/)
- Slack (Via the appstore or https://slack.com/signin)

# Install
The script has been simplified for the sake of accessibility.
Now we go and install homebrew and install git to make our lives easier.
go here for homebrew: https://brew.sh/
then we can `brew install git` if we didnt have it already.
For more information see:
https://www.atlassian.com/git/tutorials/install-git

With these two installed we can now pull down this repo.
`git clone git@github.com:moneysmartco/laptop_setup.git`

And from here we run the scripts

### Main Setup
This script will download and install the latest: homebrew, ruby, zsh, and a huge asortment of other useful tools!
Very few are strict requirements.

Just double check the setup file before committing to using it.
Then run it via shell with `sh setup`
```
view setup
sh setup
```

# Sublime setup
To access sublime from the command line eg: `subl .` to open sublime in the current directory
`ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl`

Setup sublime preferences and snippets.
It adds a fair few snippets that i enjoy.
go into the setup and run the sublime config.

```
cd laptop_setup
chmod +x ./sublime_config.rb
./sublime_config.rb
```

# Dotfiles
Terminal aliases and other handy dandy configuration options are in here.
Everything inside the `laptop_setup/dot_files` directory covers whats going on.

**DISCLAIMER**
The config script uses the force command. This means your config will be overwritten.
It is highly recommended to backup your config files before running these.
The main ones to ensure are backed up are:

```
.gitconfig
.global_gitignore
.zshrc
```
These dotfiles are also currently only setup for sublime text 3. as there are multiple
aliases using sublime.

```
cd laptop_setup
chmod +x ./config.rb
./config.rb
```

# Other setup requirements.
Individual repos will handle most of the finer detailed requirements if they are very unique.
But common pain points are:

PostgreSQL
_You may not need to do the setup below_
```
# if you havent run postgres before run

initdb -D /usr/local/var/postgres
createdb `whoami`

# Login to postgres via: `psql` and run:

CREATE USER username WITH PASSWORD 'password';
ALTER USER username CREATEDB;
ALTER USER username WITH SUPERUSER;
\q

# If you need to the user name and password may be different according to the database.yml file
```

# Zsh themes and configuration
_This is a little painful sometimes_
If you want to use zshell and make it look pretty heres one of the quickest ways to do so.

### Oh-my-zsh
oh-my-zsh is one of the quickest and easiest theming and plugin handler to setup for zsh.
https://github.com/robbyrussell/oh-my-zsh will contain much more info to assit in setup.
But to get started quickly.
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

and to change up the themes inside of your `.zshrc` you can change the `ZSH_THEME`
a list of themes can be found here
https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

When installing oh-my-zsh it will copy your current `.zshrc`.
Any existing aliases will need to be moved back into the `.zshrc` file.

# Xcode
Get it from the app store.
You may run into problems if command line tools are installed after Xcode is installed.
What happens is the Xcode-select developer directory gets pointed to  `/Library/Developer/CommandLineTools`.

Point Xcode-select to the correct Xcode Developer directory with the command:
```
sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer

# Then confirm the license agreement with:

xcodebuild -license
```

### Git Hooks
https://medium.com/beyond-the-manifesto/prepending-your-git-commit-messages-with-user-story-ids-3bfea00eab5a
There is a commit-msg.sample in this repo that will work with gitx as well.

