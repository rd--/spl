# DoubleQuotedString

- _DoubleQuotedString(s)_

The `Type` of literal strings written using double quotes.

Rewrite rule:

```
>> '"x"'.splSimplify
DoubleQuotedString('x')
```

The `unquotedString` method answers the unquoted string.

```
>>> "Double Quoted String"
DoubleQuotedString(
	'Double Quoted String'
)
```

Double quotes do not allow quoting single quote:

```
>>> "\'x\'"
DoubleQuotedString('\'x\'')
```

Double quotes allow quoting backtick quote:

```
>>> "`x`"
DoubleQuotedString('`x`')
```

`unquotedString` answers the un-quoted string:

```
>>> "Double Quoted String".unquotedString
'Double Quoted String'
```

* * *

See also: String, Symbol, quotationMark

Guides: String Syntax

Unicode: U+00022 Quotation Mark

Categories: Text, Type
