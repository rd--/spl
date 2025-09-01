# Emacs Editor

There is an _spl-mode_ for [Emacs](https://www.gnu.org/software/emacs/).

It communicates with the _spl/ts/cli_ server, which communicates with _scsynth_ at _localhost_.

Keybindings are:

- _C-cC-a_: play region
- _C-cC-e_: evaluate region
- _C-cC-k_: reset synthesiser
- _C-cC-s_: clear scheduler and reset synthesiser

Any ``` and >>> marks from _.help.sl_ files are removed from the region before sending.

The function _spl-prettier_ can be used to show Ascii block and operator names using prettier Unicode forms.
Some of the notations are:

1. `:=` as ← and `::` as ·
1. `return` as ↑ and `valueWithReturn` as ↓
1. `->` as →
1. `!=` as ≠ and `==` as ≡
1. `<=` as ≤ and `>=` as ≥
1. `++` as ⧺
1. `:/` as ⧸
1. `pi` as π and `epsilon` as ε

There are rules for generating [imenu](https://www.gnu.org/software/emacs/manual/html_node/emacs/Imenu.html) entries.
To see the `imenu` for a file type _Ctl-'_. (' is the apostrophe key).
The menu entries will include comments,
markdown headers,
and type and method definitions.

The file _emacs/spl.tag_` can be used by _etags_ to make a _TAGS_ file for Spl.
This allows _M-._ to navigate to the definition of the name at the cursor.
It also allows auto-complete, for instance using _company-mode_.

* * *

See also: Unicode Symbols
