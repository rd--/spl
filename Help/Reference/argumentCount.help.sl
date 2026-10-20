# argumentCount

- _argumentCount(f/n)_

Answer _n_,
the number of arguments that must be used to evaluate the _n_-ary block _f_.

```
>>> { }.argumentCount
0

>>> { :x | x }.argumentCount
1

>>> collect/2.argumentCount
2
```

`arity` is an alias for `argumentCount`:

```
>>> { }.arity
0
```

`argumentCount` is used to implement `cull`:

```
>>> { :x | x + 1 }.cull(3, 7)
4
```

* * *

See also: apply, argumentCount, argumentNames, cull

Guides: Block Functions, Block Semantics

References:
_Smalltalk_
5.4.1.1

Categories: Accessing
