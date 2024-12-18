# DoubleQuotedString

- _DoubleQuotedString(aString)_

The `Type` of literal strings written using double quotes.
The `contents` method answers the quoted string.

```
>>> "Double Quoted String"
DoubleQuotedString(
	'Double Quoted String'
)
```

Double quotes allow quoting single quote:

```
>>> "'x'"
DoubleQuotedString('\'x\'')
```

Double quotes allow quoting backtick quote:

```
>>> "`x`"
DoubleQuotedString('`x`')
```

* * *

See also: BacktickQuotedString, quotationMark, String

Guides: String Syntax

Unicode: U+00022 Quotation Mark

Categories: Text, Type
