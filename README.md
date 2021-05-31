# 🍍 ISuckAtSpelling.nvim

<p align="center">
	A NeoVim plugin that auto-corrects spelling mistakes in various natural and programming languages!
</p>

<p align="center">
    <a href="https://github.com/Pocco81/ISuckAtSpelling.nvim/stargazers"
        ><img
            src="https://img.shields.io/github/stars/Pocco81/ISuckAtSpelling.nvim"
            alt="Repository's starts"
    /></a>
    <a href="https://github.com/Pocco81/ISuckAtSpelling.nvim/issues"
        ><img
            src="https://img.shields.io/github/issues-raw/Pocco81/ISuckAtSpelling.nvim"
            alt="Issues"
    /></a>
    <a href="https://github.com/Pocco81/ISuckAtSpelling.nvim/blob/main/LICENSE"
        ><img
            src="https://img.shields.io/github/license/Pocco81/ISuckAtSpelling.nvim"
            alt="License"
    /><br />
    <a href="https://saythanks.io/to/Pocco81%40gmail.com"
        ><img
            src="https://img.shields.io/badge/say-thanks-modal.svg"
            alt="Say thanks"/></a
    ></a>    <a href="https://github.com/Pocco81/whid.nvim/commits/main"
    <a href="https://github.com/Pocco81/ISuckAtSpelling.nvim/commits/main"
		><img
			src="https://img.shields.io/github/last-commit/Pocco81/ISuckAtSpelling.nvim/dev"
			alt="Latest commit"
    /></a>
    <a href="https://github.com/Pocco81/ISuckAtSpelling.nvim"
        ><img
            src="https://img.shields.io/github/repo-size/Pocco81/ISuckAtSpelling.nvim"
            alt="GitHub repository size"
    /></a>
</p>


<kbd><img src ="https://i.imgur.com/bKUJPcB.gif"></kbd>
<p align="center">
	Demo
</p><hr>


# TL;DR

<div style="text-align: justify">
	ISuckAtSpelling.nvim is a NeoVim plugin written in lua that ehances (n)vim's built-in abbreviations by giving users the possibility to manage different "dictionaries" for various natural (e.g. English, Spanish) and programming (e.g. Bash, Lua) languages. It can be installed using your package manager of preference and it will work out of the box (the English dictionary enabled by default).
</div>



# 🌲 Table of Contents

* [Features](#-features)
* [Notices](#-notices)
* [Installation](#-installation)
	* [Prerequisites](#prerequisites)
	* [Adding the plugin](#adding-the-plugin)
	* [Setup Configuration](#setup-configuration)
		* [For init.lua](#for-initlua)
		* [For init.vim](#for-initvim)
	* [Updating](#updating)
* [Usage (commands)](#-usage-commands)
	* [Default](#default)
* [Configuration](#-configuration)
	* [General](#general)
	* [Highlight Colors](#highlight-colors)
* [Key Bindings](#-key-bindings)
* [Contribute](#-contribute)
* [Inspirations](#-inspirations)
* [License](#-license)
* [FAQ](#-faq)
* [To-Do](#-to-do)

# 🎁 Features
- Auto-correct spelling mistakes in both natural and programming languages.
- Users can create personalized dictionaries.
- Users can override and delete elements in the built-in dictionaries.
- Has commands to load and unload dictionaries at any given time.
- Can be set to load or not at startup.
- Tab auto-completion for the commands.


# 📺 Notices
Checkout the [CHANGELOG.md](https://github.com/Pocco81/ISuckAtSpelling.nvim/blob/main/CHANGELOG.md) file for more information on the notices below:

# 📦 Installation

## Prerequisites

- [NeoVim nightly](https://github.com/neovim/neovim/releases/tag/nightly) (>=v0.5.0)
- A nice color scheme to complement your experience ;)

## Adding the plugin
You can use your favorite plugin manager for this. Here are some examples with the most popular ones:

### Vim-plug

```lua
Plug 'Pocco81/ISuckAtSpelling.nvim'
```
### Packer.nvim

```lua
use "Pocco81/ISuckAtSpelling.nvim"
```

### Vundle

```lua
Plugin 'Pocco81/ISuckAtSpelling.nvim'
```

### NeoBundle
```lua
NeoBundleFetch 'Pocco81/ISuckAtSpelling.nvim'
```

## Setup (configuration)
As it's stated in the TL;DR, there are already some sane defaults that you may like, however you can change them to match your taste. These are the defaults:
```lua
load_natural_dictionaries_at_startup = true,
load_programming_dictionaries_at_startup = true,
natural_dictionaries = {
	["nt_en"] = {}
},
programming_dictionaries = {
	["pr_py"] = {}
}
```

The way you setup the settings on your config varies on whether you are using vimscript for this or Lua.


<details>
    <summary>For init.lua</summary>
<p>

```lua
rocal isas = require("isas")

isas.setup({
	load_natural_dictionaries_at_startup = true,
	load_programming_dictionaries_at_startup = true,
	natural_dictionaries = {
		["nt_en"] = {}
	},
	programming_dictionaries = {
		["pr_py"] = {}
	}
})
```
<br />
</details>


<details>
    <summary>For init.vim</summary>
<p>

```lua
lua << EOF
rocal isas = require("isas")

isas.setup({
	load_natural_dictionaries_at_startup = true,
	load_programming_dictionaries_at_startup = true,
	natural_dictionaries = {
		["nt_en"] = {}
	},
	programming_dictionaries = {
		["pr_py"] = {}
	}
})
EOF
```
<br />
</details>

For instructions on how to configure the plugin, check out the [configuration](#configuration) section.

## Updating
This depends on your plugin manager. If, for example, you are using Packer.nvim, you can update it with this command:
```lua
:PackerUpdate
```

# 🤖 Usage (commands)
All the commands follow the *camel casing* naming convention and have the `ISAS` prefix so that it's easy to remember that they are part of the ISuckAtSpelling.nvim plugin. These are all of them:

## Default
- `:ISASLoad <dictionary>` Loads a dictionary. If `<dictionary>` hasn't been loaded, it will load it, otherwise it will show a message explaining the error.
- `:ISASUnload <dictionary>` Unloads a dictionary. If `<dictionary>` has been loaded, it will unload it, otherwise it will show a message explaining the error.

# 🐬 Configuration
Although the settings already have self-explanatory names, here is where you can find info about each one of them and their classifications! 

## General
This settings are unrelated to any group and are independent.
- `load_natural_dictionaries_at_startup`: (Boolean) if true, it will load the dictionaries in the `natural_dictionaries` table at startup.
- `load_programming_dictionaries_at_startup`: (Boolean) if true, it will load the dictionaries in the `programming_dictionaries` tables at startup.

## Dictionaries

These two tables contain the dictionaries the user wants to be loaded at startup. Users may add their own dictionaries, but they must keep in mind to follow the conventions mentioned in below for each table. The list of supported languages can be found below. To add a language to either of both dictionaries find the its *Dict. Name* (in the table below) and add it to its corresponding table (e.g `["nt_en"]` for the english dictionary). To override certain elements of any given dictionary get [the contents of that dictionary](https://github.com/Pocco81/ISuckAtSpelling.nvim/tree/dev/lua/isas/dictionaries) and set the value of the element's key to whatever you want; set it to `"rm_isas"` to ignore it. For example:


```
natural_dictionaries = {
	["nt_en"] = {
		["adn"] = "AND",
		["THe"] = "rm_isas"
	},
	["nt_my_slangs"] {
		["lmao"] = "LMAO"
	}
},
programming_dictionaries = {
	["pr_py"] = {}
}
```

In this example, we are enabling the `Python` dictionary in the `programming_dictionaries = {}` table and we are enabling the English dictionary (`nt_en`) and custom one for slangs (`nt_my_slangs`) in the `natural_dictionaries = {}` table. In the English table we override the value of the **adn** (`["adn"]`), which is the auto-correction for mistyping the word **and**, and set it to auto-correct to **AND**. Here, we are also removing the value of **THe** from the auto-correction's list by setting it to `"rm_isas"`. Of course, it also added out custom dictionary (`["nt_my_slangs"]`).

### Natural and Programming Dictionaries
- **Natural Dictionaries:** The table `natural_dictionaries = {}` contains all the dictionaries for the various natural languages (e.g. English). The name of each dictionary **must** start with the prefix `nt_`, followed by the abbreviated version of the targeted languages' name.
- **Programming Dictionaries:** The table `programming_dictionaries = {}` contains all the dictionaries for the various programming languages (e.g. JavaScript). The name of each dictionary **must** start with the prefix `pr_`, followed by the extension that a file written in that language has (e.g for **Python** files the extension is `.py`, so we put `py` here).

#### Supported Languages

These are the lists with all the currently supported languages:

Note: In the `State` column, `working` means that the dictionary has something and it's supported, while `Supported` means that ISuckAtSpelling.nvim supports the dictionary but is under development, so it's better not to use it.

##### Natural Languages

| Nat. Language | Dict. Name | State     |
|---------------|------------|-----------|
| English       | `nt_en`    | Working   |
| Spanish       | `nt_es`    | Supported |
| Portuguese    | `nt_pt`    | Supported |

##### Programming Languages

| Pro. Language | Dict. Name | State     |
|---------------|------------|-----------|
| Python        | `pr_py`    | Supported |
| Java          | `pr_java`  | Supported |
| Lua           | `pr_lua`   | Supported |

# 🧻 Key-bindings
There are no default key-bindings. However, you can set them on your own as you'd normally do! Here is an example mapping `<F3>` to load the English dictionary while on normal:

**For init.lua**
```lua
vim.api.nvim_set_keymap(
    "n",
    "<F3>",
    "ISASLoad nt_en<CR>",
    {
        noremap = true,
        silent = true
    }
)
```

**For init.vim**
```vimscript
nnoremap <silent> <f3> :ISASLoad nt_en<CR>
```

# 🙋 FAQ

- Q: ***"How can I view the doc from NeoVim?"***
- A: Use `:help ISuckAtSpelling.nvim`


# 🫂 Contribute

Pull Requests are welcomed as long as they are properly justified and there are no conflicts. If your PR has something to do with the README or in general related with the documentation, I'll gladly merge it! Also, when writing code for the project **you must** use the [.editorconfig](https://github.com/Pocco81/ISuckAtSpelling.nvim/blob/main/.editorconfig) file on your editor so as to "maintain consistent coding styles". For instructions on how to use this file refer to [EditorConfig's website](https://editorconfig.org/).

Things I currently need help on:

- Creating dictionaries for natural languages. Use the [English dictionary](https://github.com/Pocco81/ISuckAtSpelling.nvim/blob/dev/lua/isas/dictionaries/langs_natural/nt_en.lua) as a guide.
- Creating dictionaries for programming languages. Use the [Python dictionary](https://github.com/Pocco81/ISuckAtSpelling.nvim/blob/dev/lua/isas/dictionaries/langs_programming/pr_py.lua) as a guide.


# 💭 Inspirations

The following projects inspired the creation of ISuckAtSpelling.nvim. If possible, go check them out to see why they are so amazing :]
- [preservim/vim-litecorrect](https://github.com/preservim/vim-litecorrect): Lightweight auto-correction for Vim.

# 📜 License

ISuckAtSpelling.nvim is released under the GPL v3.0 license. It grants open-source permissions for users including:

- The right to download and run the software freely
- The right to make changes to the software as desired
- The right to redistribute copies of the software
- The right to modify and distribute copies of new versions of the software

For more convoluted language, see the [LICENSE file](https://github.com/Pocco81/ISuckAtSpelling.nvim/blob/main/LICENSE.md).

# 📋 TO-DO

**High Priority**
- Add more dictionaries!

**Low Priority**
- Refactor most of the code responsible for loading the dictionaries.

<hr>
<p align="center">
	Enjoy!
</p>
