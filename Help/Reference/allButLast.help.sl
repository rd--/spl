# allButLast

- _allButLast([x₁ x₂ …], n=1)_

Answer a copy of the sequence _x_ containing all but the last _n_ elements.
Signal an error if there are not enough elements.

```
>>> [1 .. 9].allButLast(5)
[1 .. 4]

>>> [1 .. 9].allButLast(9)
[]
```

It is an error if too many items are discarded:

```
>>> { [1 .. 9].allButLast(23) }.hasError
true
```

The unary form answers all but the last element.

```
>>> [1 .. 9].allButLast
[1 .. 8]

>>> [1].allButLast
[]
```

At an empty list signals an error:

```
>>> { [].allButLast }.hasError
true
```

At `String`:

```
>>> 'text'.allButLast(3)
't'

>>> 'text'.allButLast
'tex'

>>> 'tex'.allButLast(3)
''

>>> 't'.allButLast
''
```

At `String` it is likewise an error to discard too many items:

```
>>> { ''.allButLast }.hasError
true
```

* * *

See also: allButFirst, copyFromTo, first, last

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Most.html)

Categories: Accessing
