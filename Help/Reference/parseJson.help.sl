# parseJson

- _parseJson(s)_
- _parseJson(s, f:/0)_

Answer the value represented by the `Json` encoded the string _s_.
In the binary case an else clause is specified as the no argument block _f_.

Parse `Nil`:

```
>>> 'null'.parseJson
nil
```

Parse `Boolean`:

```
>>> ['true' 'false'].collect(parseJson:/1)
[true false]
```

Parse `SmallFloat`:

```
>>> ['3.141' '23'].collect(parseJson:/1)
[3.141 23]
```

Parse `String`:

```
>>> '"str"'.parseJson
'str'
```

Parse `List`:

```
>>> '[3.141,23]'.parseJson
[3.141, 23]
```

Parse `Record`:

```
>>> '{"x":3.141,"y":23}'.parseJson
(x: 3.141, y: 23)
```

If the input is not a valid Json `String` the else clause is evaluated,
or and `Error` is signalled:

```
>>> 'invalid'.parseJson { nil }
nil

>>> {
>>> 	'invalid'.parseJson
>>> }.hasError
true
```

* * *

See also: asJson, isJson, Json

Guides: Protocol Functions

Categories: Protocol
