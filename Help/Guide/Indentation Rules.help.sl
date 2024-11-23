# Indentation Rules

The standard library and the help files follow very simple indentation rules.

Indentation is by _tab_ characters,
the Spl Emacs mode sets the tab with to eight.

The next line is shifted one place right if:

- there are more opening than closing tokens on the current line, or
- there is a trailing opening token

The current line is shifted left if:

- there is a leading closing token

There is an _spl-indent_ program that indents files according to this rule.

There is no rule for where line breaks are placed.
The convention is that closing tokens are placed on separate lines.

```
>>> sqrt(9)
3

>>> sqrt(
>>> 	9
>>> )
3
```

* * *

Guides: Leading Dot Notation
