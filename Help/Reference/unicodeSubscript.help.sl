# unicodeSubscript

- _unicodeSubscript(s)_

Answer the Unicode superscipt form of the string _s_,
else signal an error.

Subscript digit:

```
>>> '1'.unicodeSubscript
'₁'
```

Subscript letters:

```
>>> 'n'.unicodeSubscript
'ₙ'
```

Subscript number:

```
>>> '23'.unicodeSubscript
'₂₃'
```

* * *

See also: unicodeSuperscript

Guides: String Functions, Unicode Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Unicode_subscripts_and_superscripts)
