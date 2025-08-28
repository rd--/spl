# double

- _double(x)_

Answer the number _x_ multiplied by two.

At `SmallFloat`:

```
>>> 2.double
4

>>> -1.double
-2

>>> 3.2.double
6.4
```

At `Complex`:

```
>>> 1J0.double
2J0

>>> 2J1.double
4J2

>>> 3.2J3.double
6.4J6
```

At `Fraction`:

```
>>> 2/3.double
4/3
```

Threads over lists:

```
>>> [1 2 3 4].double
[2 4 6 8]
```

* * *

See also: *, halve, Number

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/plusco)
