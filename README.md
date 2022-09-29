# .dotfiles

## NVIM
`:messages` can be useful to debug when ever your config failes

### TO-DO:

- [ ] how to use lsp to rename all instances of this function name?

### THOUGHTS:

- **Treesitter** = it creates a specific tree, that then uses to highlight your code based on that, not using regex's. That's why it is faster at that PLUS existence of this tree allows to do more complex stuff, for example, selecting the code and doing something with it.
- **Lsp** =

### VIM TRICKS THAT ARE OPEN TO EVERYONE, NOT ONLY MY CONFIG:

- `fg` will jump you to the file, if your cursor is on top of the path to it
### REMAPS:

<details>
  <summary>mnemonics:</summary>

  - `<leader>md` -> **M**ard**D**own preview
  - `<leader>mm` -> **M**axi**M**izer toggle

  ### find files(using telescole):
  - `<leader>ff` -> **F**ind **F**iles
  - `<leader>ft` -> **F**ind **T**elescope grep(you can change this to `fg` it would be more logical with **F**ind **G**rep, but on my current keybord layout `g` isn't close that's why i did it)
  - `<leader>fb` -> **F**ind **B**uffers

</details>

### useful stuff

- `:nmap` will show you all of the mapping that you have for **normal mode**, this works exactly the same for `:imap`, `:vmap`. If your list is pretty long you can use jk keys to move around.
- very similar command to previous but slightly different: `:nmap <leader>` will show what leader maps you are using. This works with `:imap` and `:vmap` correspondingly.
- analog to previous commands is `:Telescope keymaps`
- `gd` – go to definition, `gr` – go to references,- this requires the lsp to be setup
- you can scroll through the old commands using `:` and arrow keys
