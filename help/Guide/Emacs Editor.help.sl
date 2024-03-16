# Emacs Editor

There is an _spl-mode_ for [Emacs](https://www.gnu.org/software/emacs/).

It communicates with the _spl/ts/cli_ server, which communicates with _scsynth_ at _localhost_.

Keybindings are:

- _C-cC-a_: play region
- _C-cC-e_: evaluate region
- _C-cC-k_: reset synthesiser
- _C-cC-s_: clear scheduler and reset synthesiser

Any ``` marks from _.help.sl_ files are removed from the region before sending.

The function _spl-prettier_ can be used to show Ascii block and operator names using prettier Unicode forms.
Some of the notations are:

1. `:=` as ← and `::` as ·
1. `return` as ↑ and `valueWithReturn` as ↓
1. `->` as →
1. `~=` as ≠ and `==` as ≡
1. `<=` as ≤ and `>=` as ≥
1. `++` as ⧺
1. `:/` as ⧸
1. `pi` as π and `epsilon` as ε

* * *

See also: Unicode Symbols
