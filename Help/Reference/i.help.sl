# i

- _i(x)_

Answer _x_ multipled by _i_, the imaginary unit.

Unlike `I` _i_ is implemented at `Complex`.

At `SmallFloat`:

```
>>> 3.i
3I

>>> 3 * 1I
3I
```

At `Fraction`:

```
>>> 3/4.i
0J0.75
```

At `Complex`:

```
>>> 2J3.i
-3J2

>>> 2J3 * 1I
-3J2
```

At `List`:

```
>>> [-1 3 5].i
[0J-1 0J3 0J5]

* * *

See also: Complex, I, times

Guides: Mathematical Constants
