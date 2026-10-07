# allFalse

- _allFalse(c, f/1=⊣)_

Answer `true` if all items in the collection _c_ are `false`, else `false`.

```
>>> ([1 3 5 7 9] > [3 5 7 9 11]).allFalse
true
```

The binary form is an alias of `noneSatisfy`:

```
>>> ([1 3 5 7 9] > [3 5 7 9 11])
>>> .allFalse(identity/1)
true
```

The empty list always answers `true`:

```
>>> [].allFalse
true
```

* * *

See also: allSatisfy, anySatisfy, allTrue, anyFalse, noneSatisfy

Guides: Boolean Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Nor.html),

Categories: Testing
