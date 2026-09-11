# Range Literal Syntax

- _α:β:γ=1_

Syntax for writing `Range` literals.

Rewrite rules:

```
>> 'i:j'.splSimplify
rangeOrRelativeRange(i, j, 1)

>> 'i:j:-1'.splSimplify
rangeOrRelativeRange(i, j, -1)
```

α and β must be either integer literals or identifiers,
and γ must be an integer literal.

In the literal form,
as with literal `Fraction` values,
white space is significant,
and `α : β` is not recognised as a range literal.

```
>>> 1:9
Range(1, 9)

>>> let m = 1;
>>> let n = 9;
>>> m:n
Range(1, 9)
```

Answer consecutive ascending `Range` values:

```
>>> 1:9
Range(1, 9)

>>> 1:9.asList
[1 2 3 4 5 6 7 8 9]
```

Ascending by two:

```
>>> 1:9:2
Range(1, 9, 2)

>>> 1:9:2.asList
[1 3 5 7 9]
```

Answer consecutive descending `Range` values:

```
>>> 9:1:-1
Range(9, 1, -1)

>>> 9:1:-1.asList
[9 8 7 6 5 4 3 2 1]
```

Descending by two:

```
>>> 9:1:-2
Range(9, 1, -2)

>>> 9:1:-2.asList
[9 7 5 3 1]
```

Answer empty `Range` values:

```
>>> 9:1
Range(9, 1)

>>> 9:1.isEmpty
true

>>> 9:1.asList
[]
```

Answer unit `Range`:

```
>>> 1:1
Range(1, 1)

>>> 1:1.size
1
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

Note that white space is particularly important in distinguishing a range literal from a record literal:

```
>>> let n = 3;
>>> (n:1:-1)
Range(3, 1, -1)

>>> let n = 3;
>>> (n: 1:-1)
(n: RelativeRange(1, -1, 1))
```

Rationale:
Identifiers are allowed as initial values,
even though it can be confused with `Record Syntax`,
because the tranlation of _i:j_ is distinct from the translation for _(i .. j)_,
which does not allow empty ranges to be specified.

* * *

See also: Range, RelativeRange

Guides: Range Syntax
