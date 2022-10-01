# .dotfiles

## NVIM
`:messages` can be useful to debug when ever your config failes

### incredibly powerful stuff you didn't know about

1. **normal mode:** `guu`/`gUU` to downcase/upcase the hole line or `gu<motion>`. for example `gUiw` will make uppercase all the letters inside current word
2. **insert mode:** `<c-o><move>` will do a <move> kipping you in insert mode. This is incredibly useful, for example, you are writing arguments for function and you simply need to go 1 charachter to the right to have cursor after the `)`, you can simply do `<c-o>l`. HOW COOL IS THIS?
- [ ] learn harpoon, quick fix list
3. `<c-q>` send to the quick fix list. What is this? How to walk it?
4. `==` to auto indent current line or `=<motion>` to auto indent <motion>
5. `<c-a>` to inc number

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
