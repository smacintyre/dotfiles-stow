# Dotfiles with GNU Stow

Managing my dotfiles with GNU Stow

## Resources

- [Insparation video](https://www.youtube.com/watch?v=y6XCebnB9gs)
- [Stow Docs](https://www.gnu.org/software/stow/manual/stow.html)

## Requirements

Ensure you have the following installed on your system

### Brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Git

```
brew install git
```

### Stow

```
brew install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ cd $HOME
$ git clone git@github.com:smacintyre/dotfiles-stow.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

Install dependencies with Brew

```
$ cd $HOME
$ brew bundle
```

Post install setup:

```
$ $(brew --prefix)/opt/fzf/install
```

## Features

### Brew Bundle

For managing installed packages with [brew](https://brew.sh).

See the [Homebrew Bundle repo](https://github.com/Homebrew/homebrew-bundle) for more details.

See also [Brew Bundle Brewfile Tips](https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f).
