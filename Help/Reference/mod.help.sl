# mod

- _mod(m, n, d=0)_

Answer the remainder on division of _m_ by _n_ using offset _d_.
In the case where _d = 0_ this is the operator `%`.

Modulo table:

```
>>> mod:/2.swap.table(1:4, 1:10)
[
	0 0 0 0 0 0 0 0 0 0;
	1 0 1 0 1 0 1 0 1 0;
	1 2 0 1 2 0 1 2 0 1;
	1 2 3 0 1 2 3 0 1 2
]
```

Compute five modulo three:

```
>>> 5.mod(3)
2
```

The remainder on division of five by three offset to start with one:

```
>>> 5.mod(3, 1)
2

>>> 17.mod(5, 1)
2

>>> 23.mod(13, -6)
-3
```

Threads over lists:

```
>>> 1:5.mod(3, 0)
[1 2 0 1 2]

>>> 1:5.mod(3, 1)
[1 2 3 1 2]

>>> -3:3.mod(3, 0)
[0 1 2 0 1 2 0]

>>> -3:3.mod(3, 1)
[3 1 2 3 1 2 3]
```

Extract parts of a list cyclically:

```
>>> ['a' 'b' 'c'] @* 1:10.mod(3, 1)
['a' 'b' 'c' 'a' 'b' 'c' 'a' 'b' 'c' 'a']
```

* * *

See also: %, /, //, \\, quotient, remainder

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Mod.html),
_W_
[1](https://en.wikipedia.org/wiki/Modulo)

Categories: Math, Operator
