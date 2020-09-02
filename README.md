# Vim-Nasm

Expanding on iosmanthus' NASM syntax highlighting and indentation for Vim

## Changes

* Renamed files in <i>indent</i> and <i>syntax</i> folders from asm to nasm, to match only .nasm extensions

## Additions

* Added ftdetect to apply filetype only to <b>.nasm</b> instead of <b>.asm</b> 
* Added NASM testing functionality

## Installation

[Pathogen](https://github.com/tpope/vim-pathogen)
   `git clone https://github.com/iosevka-soz/vim-nasm` to your Vim installations bundle directory.

[Vim-Plug](https://github.com/junegunn/vim-plug)
    Add `Plug 'iosevka-soz/vim-nasm'` to your vimrc's Vim plug section

## Usage

Syntax highlighting and indentation should just work.

To run a .nasm file, you can use :RunNasm, or map it to a keychord of your liking.
If you haven't configured your NASM and linker paths, vim-nasm will try to use the defaults:
```
nasm -f elf64 -F dwarf -wall
ld
```
See [Configuration](https://github.com/iosevka-soz/vim-nasm#configuration) for how to configure it.

When you're writing and testing, you might want to change these variables quickly, and even have them persist across vim restarts.
While you're still in a file, setting them will suffice, but then you'd have to open your vimrc and edit them, for that you can run `:SaveNasm`.
It will open your vimrc and automatically edit those lines to whatever the variables are currently set to.
By default it will ask you for confirmation on each substitution to be done, but you can disable that with `g:vim_nasm_save_skip_confirmation`.

## Configuration 

You can set these variables in your vimrc/init.vim.

* `g:loaded_vim_nasm` Set it to anything to disable the plugin 
* `g:vim_nasm_disable_default_warning` Set it to anything to disable warning the use of the default linker and NASM path when running
* `g:vim_nasm_disable_auto_write` Set it to anything to disable automatic saving of the file before running
* `g:vim_nasm_save_skip_confirmation` Set it to anything to skip confirmation when running `:SaveNasm`
* `g:nasm_run` This is how NASM will be called, you should not specify the output file, as this is handled automatically (no `-o`) nor the 
* `g:linker_run` This is how the linker will be called, you can use whatever here as long as it uses -o to specify the output 

## TODOS

Add a run with debugger (gdb/valgrind) option/command

## Acknowledgements

All credits for the syntax highlight and indentation goes to iosmanthus, I have not touched it.

