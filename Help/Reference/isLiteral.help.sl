# isLiteral

- _isLiteral(x)_

Answers `true` for values where _x_ has a literal representation in the grammar of the language,
else `false`.

The reserverd words `nil` (of type `Nil`) and `true` and `false` (of type `Boolean`) are all literals:

```
>>> [nil true false].collect(isLiteral:/1)
[true true true]
```

`SmallFloat` and `LargeInteger` values are literals:

```
>>> [3.141 23L].collect(isLiteral:/1)
[true true]
```

`Fraction` and `Complex` are both literals, but not `isJson` or `isImmediate`.

```
>>> [3/4 3J4].collect(isLiteral:/1)
[true true]
```

`String` is a literal, `Character` and `RegularExpression` are not:

```
>>> 'string'.isLiteral
true
```

A `List` is a literal if all of the items it holds are literal:

```
>>> [
>>> 	nil
>>> 	true false
>>> 	3.14 23L 3/4 3J4
>>> 	'x'
>>> ].isLiteral
true
```

A `Record` is a literal if all of the items it holds are literal:

```
>>> (x: 3.141, y: 23L, z: 3/4).isLiteral
true
```

* * *

See also: isImmediate, isJson

Guides: Literals Syntax

Categories: Testing
