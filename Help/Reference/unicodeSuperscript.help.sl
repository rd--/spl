# unicodeSuperscript

- _unicodeSuperscript(s)_

Answer the Unicode superscipt form of the string _s_,
else signal an error.

Superscript digit:

```
>>> '1'.unicodeSuperscript
'¹'
```

Superscript lowercase letter:

```
>>> 'n'.unicodeSuperscript
'ⁿ'
```

Superscript uppercase letter:

```
>>> 'Y'.unicodeSuperscript
'𐞲'
```

Superscript number:

```
>>> '23'.unicodeSuperscript
'²³'
```

* * *

See also: unicodeSubscript

Guides: String Functions, Unicode Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Unicode_subscripts_and_superscripts)
