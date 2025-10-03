# <|

- _a <| b_

The operator form of `precedes`.

At `Complex`

```
>>> 1J1 <| 2J2
true
```

At `List`:

```
>>> [1 2 3] <| [2 3 4]
true

>>> [1 2 3 4] <| [3 4]
true
```

At `String`:

```
>>> '3' <| '5'
true

>>> 'five' <| 'three'
true

>>> '-0' <| '-2'
true
```

Where supported `<|` is displayed as ≺.

* * *

See also: <, <=|, |>, compare, Comparable, precedes

Guides: Comparison Functions

Unicode: U+227a ≺ Precedes
