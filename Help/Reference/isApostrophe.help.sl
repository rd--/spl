# isApostrophe

- _isApostrophe(s)_

Answer `true` if _s_ is an apostrophe, else `false`.

```
>>> Character(16r27).isApostrophe
true
```

Neither the left or right unicode single quotation marks are an apostrophe:

```
>>> '‘'.isApostrophe
false

>>> '’'.isApostrophe
false
```

* * *

See also: apostrophe, isGraveAccent, isQuotationMark

Guides: String Functions, String Syntax

Unicode:
U+0027 Apostrophe,
U+2018 ‘ Left Single Quotation Mark,
U+2019 ’ Right Single Quotation Mark

Categories: Testing, Text
