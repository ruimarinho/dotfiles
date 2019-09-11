# dotfiles

dotfiles that give your computer personality.

## Motivation

I have lost too much time configuring and tweaking bootstrapping scripts and frameworks to know that every time I need them (i.e. once per macOS release?), I spend unnecessary time validating what they do and making sure I am still interested in what they have to offer.

They are great for shared and collaborative environments where everyone is always improving them but, for personal usage, I like to follow a *less is more* approach - keeping things easy to debug and mostly maintenance free.

## Features

* Installs my most used [brew packages and casks](brew/Brewfile).
* Switches default shell to `zsh` and installs [zim](https://github.com/zimfw/zimfw), a zsh configuration framework with blazing speed and modular extensions.
* Installs vim [Vundle](https://github.com/VundleVim/Vundle.vim), a fine plug-in manager for Vim.
* Symlinks dotfiles to home dir via [rcm](https://github.com/thoughtbot/rcm), arguably the best dotfile manager in existence.
* Configures a number of macOS [defaults](macos/defaults) to fit my needs and personal taste.
* Adds customization to [iTerm2](https://www.iterm2.com), [Sublime Text](https://www.sublimetext.com) and [vim](https://www.vim.org). For Atom, I prefer using the [sync-settings](https://atom.io/packages/sync-settings) package.
* Enables highlighting via `grc` for several binaries, such as docker, curl, make and many others. Beautiful colors, everywhere.
* Configures `git` with aliases and to source a local file (`~/.gitconfig.local`) for further customization (username, gpg key id, etc.).
* Configures `ssh` to fix some quirks with High Sierra or higher and to source local files for further customization (`~/.ssh/*.local`).
* Configures [psql](https://www.postgresql.org/docs/current/static/app-psql.html) for improved output and to source a local file (`~/.psqlrc.local`) for further customization.

### Docker Credential Helpers

To use the provided `docker-credential-aws-google-auth` binary, edit `~/.docker/config.json` and configure `credHelpers`:

```
{
  "credHelpers" : {
    "<accountId>.dkr.ecr.<region>.amazonaws.com" : "aws-google-auth"
  }
}
```

## Requirements

Just install Homebrew which will prompt you to install *Command Line Tools (CLT) for Xcode*.

  ```
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```

The rest of the utilities will be provided by Homebrew when sourcing the bundled Brewfile.

## Usage

1. Download or clone this repository.

  ```
  git clone https://github.com/ruimarinho/dotfiles.git
  ```

2. Run `script/setup`.

Feel free to clone or fork this setup. These dotfiles have been heavily inspired over the years by many others in the open source community, to whom I am grateful for.

## Updating

Because I do not frequently run the bootstrap script — most of the changes are inside existing dotfiles — a simple git pull will automatically take place as those files are symlinked by `rcm`.

The `setup` script has some safeguards in place but I can't say it's idempotent. It can be ran multiple times without *negative* consequences — Homebrew will verify all packages are installed all the time, macOS defaults will be re-applied, new dotfiles symlinked and so on.

## Next steps

* Some zim modules need to converted into upstream pull requests.
* Add default handlers and applications configuration for certain file types ([duti](http://duti.org) is not working on macOS 10.14).
