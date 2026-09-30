# isGraveAccent

- _isGraveAccent(s)_

Answer `true` if _s_ is a grave accent, else `false`.

```
>>> '`'.isGraveAccent
true

>>> Character(16r60).isGraveAccent
true
```

The left unicode single quotation mark is not a grave accent:

```
>>> '‘'.isGraveAccent
false
```

* * *

See also: graveAccent, isApostrophe, isQuotationMark

Guides: String Functions, String Syntax

Unicode:
U+0060 ` Grave Accent,
U+2018 ‘ Left Single Quotation Mark,

Categories: Testing, Text
