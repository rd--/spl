# realToComplex

- _realToComplex(x)_

Answer a `Complex` number with real part _x_ and imaginary part zero.

At `Float`:

```
>>> 1.0.realToComplex
1J0
```

At `Integer`:

```
>>> 1L.realToComplex
1J0
```

At `Fraction`:

```
>>> 23/7.realToComplex
3.28571J0.0
```

Threads over lists:

```
>>> [1 2 3].realToComplex
[1J0 2J0 3J0]
```

* * *

See also: Complex

Guides: Complex Number Functions
