# parseJson

- _parseJson(aString)_
- _parseJson(aString, elseClause:/0)_

Answer the value represented by the `Json` encoded _aString_.

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

The _elseClause_ is evaluated,
or and `Error` is signalled,
if the input is not a valid Json `String`:

```
>>> 'invalid'.parseJson { nil }
nil

>>> {
>>> 	'invalid'.parseJson
>>> }.ifError { true }
true
```

* * *

See also: asJson, isJson, Json

Categories: Protocol
