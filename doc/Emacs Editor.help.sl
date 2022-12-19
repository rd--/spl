# Emacs Editor

There is an _spl-mode_ for [Emacs](https://www.gnu.org/software/emacs/).

It communicates with the _spl/ts/cli_ server, which communicates with _scsynth_ at _localhost_.

Keybindings are:

- `C-cC-a`: play region
- `C-cC-e`: evaluate region
- `C-cC-k`: reset synthesiser
- `C-cC-s`: clear scheduler and reset synthesiser

Any ``` marks from _.help.sl_ files are removed from the region before sending.

The function _spl-prettier_ can be used to show Ascii procedure and operator names using prettier Unicode forms.
The notations are:

- :=  ←, :: ·
- return ↑, withReturn ↓
- -> →
- ~= ≠, == ≡
- <= ≤, >= ≥
- ++ ⧺
- :/ °
- pi π

* * *

See also: [Unicode Symbols]
