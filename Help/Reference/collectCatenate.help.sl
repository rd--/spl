# collectCatenate

- _collectCatenate(c, f:/1)_

Apply the block _f_,
which should answer a collection,
to each item in the collection _c_,
and add each item in each answer to the answer.

```
>>> [3 5 7].collectCatenate { :each |
>>> 	(1 .. each)
>>> }
[1 2 3 1 2 3 4 5 1 2 3 4 5 6 7]
```

This is equivalent to,
but more efficient than,
the `catenate` of `collect`:

```
>>> [3 5 7].collect { :each |
>>> 	(1 .. each)
>>> }.catenate
[1 2 3 1 2 3 4 5 1 2 3 4 5 6 7]
```

* * *

See also: catenate, collect

References:
_Haskell_
[1](https://hackage.haskell.org/package/base-4.21.0.0/docs/Data-List.html#v:concatMap)

Categories: Enumerating
