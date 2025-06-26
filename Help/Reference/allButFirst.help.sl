# allButFirst

- _allButFirst([x₁ x₂ …], n=1)_

Answer a copy of the sequence _x_ containing all but the first _n_ elements.
Signal an error if there are not enough elements.

```
>>> [1 .. 9].allButFirst(5)
[6 .. 9]

>>> 'text'.allButFirst(3)
't'
```

The unary form answers all but the first element.

```
>>> [1 .. 9].allButFirst
[2 .. 9]

>>> 'text'.allButFirst
'ext'
```

If the sequence has as many places as are discared answer the empty sequence:

```
>>> [1].allButFirst
[]
```

If there are too few items an `error` is signalled:

```
>>> { [].allButFirst }.ifError { true }
true
```

* * *

See also: allButLast

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Rest.html)

Categories: Accessing
