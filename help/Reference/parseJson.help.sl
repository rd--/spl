# parseJson

_parseJson(aString)_

Answer the value represented by the Json encoded _aString_.

Nil:

```
>>> 'null'.parseJson
nil
```

Boolean:

```
>>> ['true' 'false'].collect(parseJson:/1)
[true false]
```

SmallFloat:

```
>>> ['3.141' '23'].collect(parseJson:/1)
[3.141 23]
```

String:

```
>>> '"str"'.parseJson
'str'
```

List:

```
>>> '[3.141,23]'.parseJson
[3.141, 23]
```

Record:

```
>>> '{"x":3.141,"y":23}'.parseJson
(x: 3.141, y: 23)
```

* * *

See also: json, Json

Categories: Protocol
