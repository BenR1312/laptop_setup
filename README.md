# laptop_setup
Mac Laptop setup for new and existing moneysmart developers.

# Common requirements
- Firefox (version 46.0.1) https://ftp.mozilla.org/pub/firefox/releases/
- Chrome (https://www.google.com/chrome/)
- Xcode (via the app store, make sure you run it and accept the license agreement aswell!)
- Sublime text 3 or Atom (https://www.sublimetext.com/3) (https://atom.io/)
- Iterm2 (https://www.iterm2.com/)
- Slack (Via the appstore or https://slack.com/signin)

# Install
Download, review and execute the setup script.

### Zshell
This script will download and install the latest: homebrew, ruby, zsh, and a huge asortment of other useful tools!
Very few are strict requirements.
```
curl -u YOUR_USER_NAME_HERE -H "Accept: application/vnd.github.raw" -O https://raw.githubusercontent.com/moneysmartco/laptop_setup/master/setup
less setup
sh setup
```

### Bash
TODO

# Sublime setup
To access sublime from the command line
`ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl`

Setup sublime preferences and snippets.
```
cd laptop_setup
chmod +x ./sublime_config.rb
./sublime_config.rb
```

# Dotfiles
You will now have access to the basic tools to pull the repo down from github.
`git clone git@github.com:moneysmartco/laptop_setup.git`
From here you can chose to run the setup files for dotfiles and/or sublime snippets.
**DISCLAIMER**
The config script uses the force command. This means your config will be overwritten.
It is highly recommended to backup your config files before running these.
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

### Prezto
Prezto is another framework for zsh that has access to some themes and styles.
https://github.com/sorin-ionescu/prezto

`git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"`

# Bash themes and configuration
TODO

# Emails and Calendar
Select any email or calender client that you like.
If there are any good suggestions then please talk to #Dev on slack.

# Xcode
Get it from the app store.

You may run into problems if command line tools are installed after Xcode is installed. What happens is the Xcode-select developer directory gets pointed to  `/Library/Developer/CommandLineTools`.

Point Xcode-select to the correct Xcode Developer directory with the command:
```
sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer

# Then confirm the license agreement with:

xcodebuild -license
```
