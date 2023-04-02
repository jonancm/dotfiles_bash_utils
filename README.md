# Utilities to write bash scripts for dotfile management

This repository provides some utilities to write bash scripts to manage user
configuration files (a.k.a. dotfiles):

* `pkg`: utilities for package management
* `sys`: system utilities
* `term`: utilities for console (terminal) I/O

This repository is included as a [submodule] in the following repositories:

* [jonancm/dotfiles_fish](https://github.com/jonancm/dotfiles_fish)
* [jonancm/dotfiles_zsh](https://github.com/jonancm/dotfiles_zsh)

[submodule]: https://git-scm.com/book/en/v2/Git-Tools-Submodules

To use the utilities provided by this repository in your own Git repository:

1. Initialize submodules in your repository:

   ```bash
   git submodule init
   ```

2. Add this repository as a submodule:

   ```bash
   git submodule add https://github.com/jonancm/dotfiles_bash_utils.git bash_utils
   ```

3. In your shell scripts, `source` the utilities script that you want to import:

   ```bash
   source $(dirname ${BASH_SOURCE})/bash_utils/sys/detect.sh
   ```
