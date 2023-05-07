# Introduction

This repo contains bash initialization scripts for use across machines.

## How to use

Sync this repo to the local machine and run setup.sh.

This will move any existing scripts into .dotfiles/local_backup and link
the ones in the repo.

```bash
cd ~
git clone https://github.com/ianjirka/dotfiles .dotfiles
.dotfiles/setup.sh
```

## How to enable machine-specific profiles

If any bash initialization files with an extension .local exist, these scripts will execute them.

For example : `.bash_login` will source `.bash_login.local` if it exists.