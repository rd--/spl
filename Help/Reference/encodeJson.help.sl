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
>>> [true false].collect(encodeJson/1)
['true' 'false']
```

At `SmallFloat`:

```
>>> [3.141 23].collect(encodeJson/1)
['3.141' '23']
```

Infinities and not-a-number encode as `nil`:

```
>>> NaN.encodeJson
'null'

>>> Infinity.encodeJson
'null'

>>> -Infinity.encodeJson
'null'
```

At `String`:

```
>>> 'str'.encodeJson
'"str"'
```

At `List`,
all items must have Json encodings:

```
>>> [3.141 23].encodeJson
'[3.141,23]'

>>> {
>>> 	[1/2, 3J4].encodeJson
>>> }.hasError
true
```

At `Record`,
all items must have Json encodings:

```
>>> (x: 3.141, y: 23).encodeJson
'{"x":3.141,"y":23}'

>>> {
>>> 	(x: 22/7, y: 23).encodeJson
>>> }.hasError
true
```

Other dictionary types can be encoded by first translating them to records:

```
>>> let a = ['x' -> 3.141, 'y' -> 23];
>>> let b = Record(a);
>>> b.encodeJson
'{"x":3.141,"y":23}'

>>> let a = Map['x' -> 3.141, 'y' -> 23];
>>> let b = Record(a);
>>> b.encodeJson
'{"x":3.141,"y":23}'
```

Not implemented at `Fraction`,
or `Complex`,
or `Association`:

```
>>> {
>>> 	1/2.encodeJson
>>> }.hasError
true

>>> {
>>> 	1J2.encodeJson
>>> }.hasError
true

>>> {
>>> 	(1 -> 2).encodeJson
>>> }.hasError
true
```

* * *

See also: Json, isJson, parseJson

Guides: Protocol Functions

References:
_Json_
[1](https://www.json.org/json-en.html)

Further Reading: Crockford 2006

Categories: Protocol, Serialisation
