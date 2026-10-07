# anyTrue

- _anyTrue(c, f/1=⊣)_

Answer `true` if any items in the collection _c_ are `true`, else `false`.
This is equal to the unary form of `||`.

```
>>> ([1 3 5 7 9] > [3 5 7 9 1]).anyTrue
true

>>> ([1 3 5 7 9] > [3 5 7 9 1]).||
true
```

The binary form is an alias of `anySatisfy`:

```
>>> ([1 3 5 7 9] > [3 5 7 9 1])
>>> .anyTrue(identity/1)
true

>>> [1 2 3 4 5J6].anyTrue(isComplex/1)
true
```

The empty list always answers `false`,
since there are no true values,
unlike `allTrue`:

```
>>> [].anyTrue
false

>>> [].allTrue
true
```

* * *

See also: allSatisfy, allFalse, allTrue, anySatisfy, noneSatisfy

Guides: Boolean Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AnyTrue.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#any)

Categories: Testing
