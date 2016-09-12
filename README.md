# utils

Utilities for personal use.

## Get started

Utilities are managed by [Stow](https://www.gnu.org/software/stow/) so you'd better install it first.

```
stow (GNU Stow)
SYNOPSIS:
    stow [OPTION ...] [-D|-S|-R] PACKAGE ... [-D|-S|-R] PACKAGE ...
OPTIONS:
    -d DIR, --dir=DIR     Set stow dir to DIR (default is current dir)
    -t DIR, --target=DIR  Set target to DIR (default is parent of stow dir)
    -S, --stow            Stow the package names that follow this option
    -D, --delete          Unstow the package names that follow this option
    -R, --restow          Restow (like stow -D followed by stow -S)
```

For this repository, it can used as a Stow root directory containing several packages such as `ydcv` and etc. After stowwing any of them, the corresponding symbolinks will be created in the target directory. Below is an example for ydcv.

``` sh
# Clone this repo.
git clone git@github.com:gujiaxi/utils.git ~/.utils
# Enter the directory.
cd .utils/
# Create the symbolink for it
stow -t /usr/local/bin -S ydcv
```