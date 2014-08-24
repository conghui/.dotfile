#!/bin/bash

# The script is used to make soft link to HOME

DESTDIR="${HOME}/"

# make symbolic links for the files except the following
# 1. bashrc_append
for f in *; do
    file_ext=${f##*.} # get the file extension
    DESTFILE="${DESTDIR}/.$f" # the name of destination file

    # skip the distributing shell script
    [[ $file_ext = "sh" ]] && continue
    [[ $f = "bashrc_append" ]] && continue
    [[ $f = "git-completion" ]] && continue

    # remove the existing files
    [[ -e $DESTFILE ]] && rm -rf $DESTFILE

    # make a linkage to that file
    ln -sf "`pwd`/$f" "${DESTFILE}"
done

# append bash_append to ~/.bashrc
for f in "~/.cfg/dotfile/bash/bashrc_append" \
         "~/.cfg/dotfile/bash/git-completion"; do
  if ! grep -q $f ~/.bashrc; then
    echo -e "\n[[ -f $f ]] && source $f"  >> ~/.bashrc
  fi
done

echo "Installation Done!"
