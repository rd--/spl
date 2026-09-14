# Range Literal Syntax

- _α:β:γ=1_

Syntax for writing `Range` literals.

Rewrite rules:

```
>> '1:n'.splSimplify
Range(1, n, 1)

>> '1:n:-1'.splSimplify
Range(1, n, -1)
```

α and β must be either small or large integer literals or identifiers,
and γ must be an integer literal.

In the literal form,
as with literal `Fraction` values,
white space is significant,
and `α : β` is not recognised as a range literal.

```
>>> 1:9
Range(1, 9)

>>> let n = 9;
>>> 1:n
Range(1, 9)
```

A `Range` of `LargeInteger` values:

```
>>> 1L:9L
Range(1L, 9L)

>>> 1L:9.elementType
'LargeInteger'
```

As with `Fraction` literals,
`Range` literals are parsed as a single token:

```
>>> 1:3.square
[1 4 9]

>>> [1 .. 3.square]
[1 2 3 4 5 6 7 8 9]
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

Rationale:
Identifiers are not allowed as initial values,
because it can too easily be confused with `Record Syntax`.
Instead of _i:j_ write _(i .. j)_.

* * *

See also: Range, RelativeRange

Guides: Range Syntax
