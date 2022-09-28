# .dotfiles

## NVIM
`:messages` can be useful to debug when ever your config failes

### REMAPS:

#### mnemonics:

- `<leader>md` -> **M**ard**D**own preview
- `<leader>mm` -> **M**axi**M**izer toggle
##### find files(using telescole)
- `<leader>ff` -> **F**ind **F**iles
- `<leader>fg` -> **F**ind **G**rep
- `<leader>fb` -> **F**ind **B**uffers

### useful stuff

- `:nmap` will show you all of the mapping that you have for **normal mode**, this works exactly the same for `:imap`, `:vmap`. If your list is pretty long you can use jk keys to move around.
- very similar command to previous but slightly different: `:nmap <leader>` will show what leader maps you are using. This works with `:imap` and `:vmap` correspondingly.
- analog to previous commands is `:Telescope keymaps`
- `gd` – go to definition, `gr` – go to references,- this requires the lsp to be setup
- you can scroll through the old commands using `:` and arrow keys
