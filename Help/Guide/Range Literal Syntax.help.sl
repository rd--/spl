# Range Literal Syntax

- _α:β_
- _α:β:γ_

Rewrite rules:

```
>> '1:n'.splSimplify
rangeOrRelativeRange(1, n, 1)

>> 'n:1:-1'.splSimplify
rangeOrRelativeRange(n, 1, -1)
```

α and β must be either integer literals or identifiers.
In the literal form,
as with literal `Fraction` values,
white space is significant,
and `α : β` is not recognised as a range literal.

```
>>> 1:9
Range(1, 9, 1)

>>> let n = 9;
>>> 1:n
Range(1, 9, 1)
```

Answer ascending `Range` values:

```
>>> 1:9
Range(1, 9, 1)

>>> 1:9.asList
[1 2 3 4 5 6 7 8 9]

>>> 1:9:2
Range(1, 9, 2)

>>> 1:9:2.asList
[1 3 5 7 9]
```

Answer descending `Range` values:

```
>>> 9:1:-1
Range(9, 1, -1)

>>> 9:1:-1.asList
[9 8 7 6 5 4 3 2 1]

>>> 9:1:-2
Range(9, 1, -2)

>>> 9:1:-2.asList
[9 7 5 3 1]
```

Answer empty `Range` values:

```
>>> 9:1
Range(9, 1, 1)

>>> 9:1.isEmpty
true

>>> 9:1.asList
[]
```

Answer `RelativeRange` values,
the notation _1:-1_ indicates the range from the first to the last index,
the notation _-1:1:-1_ indicates the range from the last to the first index:

```
>>> 1:-1
RelativeRange(1, -1, 1)

>>> -1:1:-1
RelativeRange(-1, 1, -1)

>>> [1 .. 9].part([1:-1])
[1 2 3 4 5 6 7 8 9]
```

Note that white space is particularly important in distinguishing a ternary range literal from a record literal:

```
>>> let n = 3;
>>> (n:1:-1)
Range(3, 1, -1)

>>> let n = 3;
>>> (n: 1:-1)
(n: RelativeRange(1, -1, 1))
```

* * *

See also: Range, RelativeRange

Guides: Range Syntax
