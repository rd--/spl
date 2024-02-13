# json

_json(anObject)_

String encoding for a small set of types.
Answers a String.

Nil:

```
>>> nil.json
'null'
```

Boolean:

```
>>> [true false].collect(json:/1)
['true' 'false']
```

SmallFloat:

```
>>> [3.141 23].collect(json:/1)
['3.141' '23']
```

String:

```
>>> 'str'.json
'"str"'
```

List:

```
>>> [3.141 23].json
'[3.141,23]'
```

Record:

```
>>> (x: 3.141, y: 23).json
'{"x":3.141,"y":23}'
```

* * *

See also: Json, parseJson

Categories: Protocol, Serialisation
