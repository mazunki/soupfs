# SoupFS: A Tag-Based File System

## Overview

SoupFS is a unique, tag-based file system designed to organize files in a non-hierarchical way.

By treating directories as tags, we can enter directories to apply filters to our collection of files. Moving files into a directory is analogous to applying said tag, and the order in which directories are entered is meaningless.

This makes SoupFS particularly well-suited for managing large collections of media files, such as images and memes.

## Getting Started

To get started with SoupFS, install soupfs through your package manager, or build it yourself through the installation steps below.

To use soupfs, you will need a block device to act as your partition, on which you can make a soup filesystem. If you don't want to reformat your partition, we suggest using a loop device stored as a regular file elsewhere. To do this, do something the following, as the superuser:

```sh
soupfs_img=/path/to/your/media_file.img
dd if=/dev/zero of="${soupfs_img}" bs=1M count=1024
losetup -fP "${soupfs_img}"
```

This will create a file, `${soupfs_img}` of 1G (1M * 1024). The block sized used here does not affect the filesystem, only the speed at which you can create the file. Afterwards, you will tell your system to create a loop device pointing to this file. You will need to do this on each reboot, so you might want to put it in your fstab.


## Installation

To build the filesystem, simply run `make`. If you additionally want to create the shell interface (which is currently necessary, since we are not able to mount the filesystem, yet), run `make shell`, which is included in the `all` target, too.

```sh
make all
make install
```

Build files appear under the `build/` subdirectory. The `target/` subdirectory will include everything you need to copy onto your prefixed system path (`PREFIX=/usr` by default), which is what the `install` target does (and thus you need to run it as root). 


## Contributing

Feel free to make pull requests, or report issues if you encounter them! Please start by checking out the  [contributing guidelines](CONTRIBUTING.md) for details.

