# encodeJson

- _encodeJson(x)_

Encode the object _x_ as a _Json_ value.
The encoding is defined by _ECMA-404: The JSON Data Interchange Standard_.
Answers a `String`.

The following types have standard Json encodings:
`Nil`, `Boolean`, `SmallFloat`, `String`, `List` and `Record`.

Any type or trait may implement `encodeJson`,
however only the types listed above will be answered by `parseJson`.
For these types `encodeJson` and `parseJson` are partial inverses.

At `Nil`:

```
>>> nil.encodeJson
'null'
```

At `Boolean`:

```
>>> [true false].collect(encodeJson:/1)
['true' 'false']
```

At `SmallFloat`:

```
>>> [3.141 23].collect(encodeJson:/1)
['3.141' '23']
```

At `String`:

```
>>> 'str'.encodeJson
'"str"'
```

At `List`:

```
>>> [3.141 23].encodeJson
'[3.141,23]'
```

At `Record`:

```
>>> (x: 3.141, y: 23).encodeJson
'{"x":3.141,"y":23}'
```

Other dictionary types can be encoded by first translating them to records:

```
>>> ['x' -> 3.141, 'y' -> 23]
>>> .asRecord
>>> .encodeJson
'{"x":3.141,"y":23}'
```

* * *

See also: isJson, Json, parseJson

Guides: Protocol Functions

References:
_Json_
[1](https://www.json.org/json-en.html)

Further Reading: Crockford 2006

Categories: Protocol, Serialisation
