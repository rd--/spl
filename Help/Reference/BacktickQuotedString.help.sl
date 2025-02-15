# BacktickQuotedString

- _BacktickQuotedString(aString)_

The `Type` of literal strings written using backtick (or _grave accent_) quotes.
The `contents` method answers the quoted string.

```
>>> `Backtick Quoted String`
BacktickQuotedString(
	'Backtick Quoted String'
)
```

Backtick quotes do not allow unquoted single quotes:

```
>>> `\'x\'`
BacktickQuotedString('\'x\'')
```

Backtick quotes allow double quotes:

```
>>> `"x"`
BacktickQuotedString('"x"')
```

Backtick quoted single and double quotes:

```
>>> `x\'""\'y`
BacktickQuotedString('x\'""\'y')
```

* * *

See also: DoubleQuotedString, graveAccent, String

Guides: String Syntax

Unicode: U+00060 Grave Accent

Categories: Text, Type
