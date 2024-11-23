# isJson

- _isJson(anObject)_

Answers `true` for values that have a Json representation,
else `false`.

The reserverd words `nil` (of type `Nil`) and `true` and `false` (of type `Boolean`) can all be Json encoded:

```
>>> [nil true false].collect(isJson:/1)
[true true true]
```

As can `SmallFloat` and `String` values:

```
>>> 3.141.isJson
true

>>> 'string'.isJson
true
```

A `List` can be encoded if all of the items it holds can be:

```
>>> [nil true false 3.14 'x'].isJson
true
```

A `Record` can be encoded if all of the items it holds can be:

```
>>> (x: 3.141, y: [23], z: 'z').isJson
true
```

* * *

See also: isImmediate, Json, json

Categories: Testing
