# Writing

- _Writing(aString, coordinates)_

`Writing` is a `Type` holding a `String` with associated coordinates.

An Svg decription of writing:

```
>>> Writing('Writing', [0, 0]).asSvg
'<text x="0" y="0" fill="black" stroke="none">Writing</text>'
```

Rationale: `Text` is a primitive type.
It could be renamed safely, and this object called `Text`.

* * *

See also: Record, String
