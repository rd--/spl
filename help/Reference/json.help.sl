# json

- _json(nil | aBoolean | aSmallFloat | aString | aList | aRecord)_
- _json(aResponse)_

Encode _anObject_ using as a _Json_ value,
as defined by _ECMA-404: The JSON Data Interchange Standard_.
Answers a `String`.

At `Nil`:

```
>>> nil.json
'null'
```

At `Boolean`:

```
>>> [true false].collect(json:/1)
['true' 'false']
```

At `SmallFloat`:

```
>>> [3.141 23].collect(json:/1)
['3.141' '23']
```

At `String`:

```
>>> 'str'.json
'"str"'
```

At `List`:

```
>>> [3.141 23].json
'[3.141,23]'
```

At `Record`:

```
>>> (x: 3.141, y: 23).json
'{"x":3.141,"y":23}'
```

At `Response` answers a `Promise` that will hold the Json value encoded in the `Response`.

* * *

See also: isJson, Json, parseJson, Response

References:
_Json_
[1](https://www.json.org/json-en.html)

Categories: Protocol, Serialisation
