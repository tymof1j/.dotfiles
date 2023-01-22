# .dotfiles

## Tmux setup:

1. Go to [tpm](https://github.com/tmux-plugins/tpm/tree/59f78857f656afd462d7bc99b31cc8cc36c1872c) which stands for tmux plugin manager and install it using instruction.
2. Copy [tmux configuration](https://github.com/tymof1j/.dotfiles/blob/main/.tmux.conf) into user directory. Alternative configuration with another status bar, which also looks nice: [bash bunni conf](https://github.com/bashbunni/dotfiles/blob/main/.tmux.conf), [oh my tmux](https://github.com/gpakosz/.tmux) which is overkill in my point of view.
3. Make sure your previous tmux is stopped with `tmux kill-server` command. After this you can open new tmux session with `tmux new` and then run `nvim .tmux.conf`.
4. Prefix+I, which should be `<C-a>I`. This should install plugins using tpm.
5. Exit nvim with `ZZ` and run `tmux source ~/.tmux.conf` which should apply installed plugins.

### Basic commands:
- `prefix ,` - rename window
- `prefix c` - create new window
- `prefix x` - close window
- `prefix d` - detach
- `prefix f` - search by window or session names. Make sure you have [ripgrep](https://github.com/BurntSushi/ripgrep) installed because it's used for this.
- `prefix n` - open next window
- `prefix p` - open previous window

## NVIM
`:messages` can be useful to debug when ever your config failes

### TO-DO:

- [ ] how to use lsp to rename all instances of this function name?

### THOUGHTS:

- **Treesitter** = it creates a specific tree, that then uses to highlight your code based on that, not using regex's. That's why it is faster at that PLUS existence of this tree allows to do more complex stuff, for example, selecting the code and doing something with it.
- **Lsp** =

### VIM TRICKS THAT ARE OPEN TO EVERYONE, NOT ONLY MY CONFIG:

- `fg` will jump you to the file, if your cursor is on top of the path to it
=======
### incredibly powerful stuff you didn't know about

1. **normal mode:** `guu`/`gUU` to downcase/upcase the hole line or `gu<motion>`. for example `gUiw` will make uppercase all the letters inside current word
2. **insert mode:** `<c-o><move>` will do a <move> kipping you in insert mode. This is incredibly useful, for example, you are writing arguments for function and you simply need to go 1 charachter to the right to have cursor after the `)`, you can simply do `<c-o>l`. HOW COOL IS THIS?
- [ ] learn harpoon, quick fix list
3. `<c-q>` send to the quick fix list. What is this? How to walk it?
4. `==` to auto indent current line or `=<motion>` to auto indent <motion>
5. `<c-a>` to inc number


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
