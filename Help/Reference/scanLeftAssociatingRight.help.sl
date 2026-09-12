# scanLeftAssociatingRight

- _scanLeftAssociatingRight([x₁ x₂ …], f:/2)_

A variant of `scanLeft` that associates arguments to the right.
That is,
where `scanLeft` will reduce a triple as _f(f(i,j),k)_,
`scanLeftAssociatingRight` will reduce the same triple as _f(i,f(j,k))_.
This is the Apl _scan_.

```
>>> 1:5.scanLeftAssociatingRight(-)
[1 -1 2 -2 3]

>>> [
>>> 	1,
>>> 	1 - 2,
>>> 	1 - (2 - 3),
>>> 	1 - (2 - (3 - 4)),
>>> 	1 - (2 - (3 - (4 - 5)))
>>> ]
[1 -1 2 -2 3]

>>> 1:5.scanLeftAssociatingRight(-.swap)
[1 1 0 -2 -5]
```

* * *

See also: scan, scanLeft, scanRight

References:
_Apl_
[1](https://aplwiki.com/wiki/Scan)

Categories: Enumerating
