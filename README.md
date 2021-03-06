## .hot

> Hot hot hot dotfile management

Current dotfile management approaches tend to fall into 1 of 2 categories:

(1) standard setup -- dotfiles of all types are stored in many locations across system, and these dotfiles are edited in these different locations. This approach has the lowest barrier, but is the least effective in the long-run. The approach is easiest at first, because you are storing and editing the dotfiles in-place, where the consuming programs expect. This is the least robust approach because it makes change management, backup, restoration, and portability of your development environment a nightmare.

(2) custom setup for storage -- this approach tries to mitigate the problems with approach (1) by 'storing' all the dotfiles in a single location (remote repository). Event though all the source files are being tracked and backed up in one location, these source files are still spread out throughout the system where consuming programs expect to find them, so editing is still a painful process, even if restoration and portability is better than (1).

I would like to store my dotfiles in one location for ease of portability and backup, but I would also like to edit the source of my dotfiles in one location, without having to open a bunch of files spread across my file system. In order to get this 'best-of-both-worlds', `.hot` allows you to store and edit your dotfiles in a single location, while mapping those source files to the required system locations expected by dotfile consumers.

#### Installation

Before installation, make sure to back up the following files if you are interested in keeping them:

`.aliases, .zshrc, .bashrc, .bash_profile, .vimrc, .tmux.conf, .gitignore, .gitconfig`

The easiest way to install `.hot` is the following:
1. fork the repository https://github.com/Cfeusier/.hot so that you have your own copy for editing.
2. Run the following command in your shell (replace github-username with your own):

```sh
curl -Lks https://raw.githubusercontent.com/<github-username>/.hot/master/.bin/hot.sh | /bin/bash -s -- install
```

The installation script will set up your environment by creating symbolic links between files in `.env` and the correct dotfiles at the system-level.

#### Management

Edit your dotfiles in `.env`, and then use `hot g` just like `git`, to add, commit, and push to your remote repository. Once ready, run one of the `link_*` commands to setup your environment with new changes. For example, if you changed your `.vimrc` file in `.env`, you would run `link_vim`.

#### Commands

`hot g`: hot-wrapped Git -- run any Git command against your .hotfiles

`hot link_*`: link the source dotfiles to system-dotfile location

  - link commands:
    - link_bash
    - link_zsh
    - link_git
    - link_tmux
    - link_vim

### TODO

- package managers
- languages/interpreters/compilers
- zsh, brew, git, etc. installs
- VSC/vim-plugins
- work-specific setup
- packages
- key-bindings
- OS configuration customizations
- work-flow applications
- ssh setup/certs
- aliases
- write dotfiles in `.env`, as they are just stubs

### License

MIT LICENSE

*.hot* -- hot hot hot dotfile management

Copyright (C) 2017 Clark Feusier cfeusier@gmail.com - All Rights Reserved

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

