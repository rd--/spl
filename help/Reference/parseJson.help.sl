# parseJson

- _parseJson(aString)_

Answer the value represented by the _Json_ encoded _aString_.

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

* * *

See also: json, Json

Categories: Protocol
