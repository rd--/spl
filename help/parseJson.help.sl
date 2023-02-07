# parseJson -- protocol

- _parseJson(aString)_

```
["null", "true", "false"].collect(parseJson:/1) = [nil, true, false]
["3.141", "23"].collect(parseJson:/1) = [3.141, 23]
'"str"'.parseJson = 'str'
'[3.141,23]'.parseJson = [3.141, 23]
'{"x":3.141,"y":23}'.parseJson = (x: 3.141, y: 23)
```

* * *

See also: _json_
