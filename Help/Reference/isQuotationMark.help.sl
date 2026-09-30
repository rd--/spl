# isQuotationMark

- _isQuotationMark(s)_

Answer `true` if _s_ is a quotation mark, else `false`.

```
>>> '"'.isQuotationMark
true

>>> Character(16r22).isQuotationMark
true
```

Neither the left or right unicode double quotation marks are quotation marks:

```
>>> '“'.isQuotationMark
false

>>> '”'.isQuotationMark
false
```

* * *

See also: isApostrophe, isGraveAccent, quotationMark

Guides: String Functions, String Syntax

Unicode: U+0022 Quotation Mark,
U+201C “ Left Double Quotation Mark,
U+201D ” Right Double Quotation Mark,

Categories: Testing, Text
