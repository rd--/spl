# asJson

- _asJson(nil | aBoolean | aSmallFloat | aString | aList | aRecord)_

Encode _anObject_ as a _Json_ value.
The encoding is defined by _ECMA-404: The JSON Data Interchange Standard_.
Answers a `String`.

Any type or trait may implement `asJson`,
however only the types listed above will be answered by `parseJson`.
For these types `asJson` and `parseJson` are partial inverses.

At `Nil`:

```
>>> nil.asJson
'null'
```

At `Boolean`:

```
>>> [true false].collect(asJson:/1)
['true' 'false']
```

At `SmallFloat`:

```
>>> [3.141 23].collect(asJson:/1)
['3.141' '23']
```

At `String`:

```
>>> 'str'.asJson
'"str"'
```

At `List`:

```
>>> [3.141 23].asJson
'[3.141,23]'
```

At `Record`:

```
>>> (x: 3.141, y: 23).asJson
'{"x":3.141,"y":23}'

>>> ['x' -> 3.141, 'y' -> 23]
>>> .asRecord
>>> .asJson
'{"x":3.141,"y":23}'
```

* * *

See also: isJson, Json, parseJson

References:
_Json_
[1](https://www.json.org/json-en.html)

Further Reading: Crockford 2006

Categories: Protocol, Serialisation
