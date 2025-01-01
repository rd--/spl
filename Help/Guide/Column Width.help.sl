# Column Width

Text formatting for documents that are to be viewed in different contexts is a vexed issue.
This is particularly the case in relation to program fragments,
where line-breaks and indentation are important in indicating the program structure.

Variables that need to be considered include:
font type,
font size,
line length (column width),
and interlinear spacing.

The most important aspect of the font type is whether it is monospace (fixed-width) or proportional (variable-width).

The programs below count the number of characters in three strings,
which are of equal length.

```
>>> '------------------------------'
>>> .size
30

>>> '123456789012345678901234567890'
>>> .size
30

>>> '         ^         ^         ^'
>>> .size
30
```

The font type also effects decisions about how to use letter cases.
In fixed-width fonts the distinction between lower and upper case letters is often less marked than in variable-wdith fonts.

The convention in some systems of writing constants in all upper-case,
i.e. `LINE_LENGTH` in C or `*LINE-LENGTH*` in Lisp,
can make these words particularly prominent if a variable-width font is selected.

```
>>> 'abcdefghijklmnopqrstuvwxyz'
>>> .size
26

>>> 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
>>> .size
26

>>> '12345678901234567890123456'
>>> .size
26
```

Telephone dimensions:

- Apple iPhone SE: 375×667
- Apple iPhone 12 Pro: 390×844
- Apple iPhone 14 Pro Max: 430×932
- Google Pixel 7: 412×915
- Samsung Galaxy S8+: 360×740
- Samsung Galaxy S20 Ultra: 412×915
- Samsung Galaxy Z Fold5: 344×882

Tablet dimensions:

- Apple iPad Mini: 768×1024
- Apple iPad Air: 820×1180
- Apple iPad Pro: 1024×1366
- Microsoft Surface Pro 7: 912×1368

* * *

References:
_W_
[1](https://en.wikipedia.org/wiki/Monospaced_font)
[2](https://en.wikipedia.org/wiki/Line_length)

Further Reading: Dyson 2004
