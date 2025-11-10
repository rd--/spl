# Span Syntax

Rewrite rules:

- _α:β_ => _Span(α, β, 1)_
- _α:γ:β_ => _Span(α, β, γ)_

```
>> '1:x'.splSimplify
Span(1, x, 1)

>> '9:-1:x'.splSimplify
Span(9, x, -1)
```

In the case where α is an integer literal,
and β is an integer literal or an identifier,
a `Range` can be written α:β.
In the literal form,
as with literal `Fraction` values,
white space is significant,
and `α : β` is not allowed.

```
>>> 1:9
Range(1, 9, 1)

>>> let k = 9;
>>> 1:k
Range(1, 9, 1)
```

Answer ascending `Range` values:

```
>>> 1:9
Range(1, 9, 1)

>>> 1:9.asList
[1 2 3 4 5 6 7 8 9]

>>> 1:2:9
Range(1, 9, 2)

>>> 1:2:9.asList
[1 3 5 7 9]
```

Answer descending `Range` values:

```
>>> 9:-1:1
Range(9, 1, -1)

>>> 9:-1:1.asList
[9 8 7 6 5 4 3 2 1]

>>> 9:-2:1
Range(9, 1, -2)

>>> 9:-2:1.asList
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

Answer relative `Span` values,
the notation _1:-1_ indicates the span from the first to the last index,
the notation _-1:-1:1_ indicates the span from the last to the first index:

```
>>> 1:-1
Span(1, -1, 1)

>>> -1:-1:1
Span(-1, 1, -1)

>>> [1 .. 9].part([1:-1])
[1 2 3 4 5 6 7 8 9]
```

* * *

See also: Range, Span

Guides: Range Syntax
