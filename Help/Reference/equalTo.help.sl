# equalTo

- _equalTo(y)_

Answer a `Block` that yields _x=y_ when applied to an expression _x_.

Check numeric equality:

```
>>> let f:/1 = equalTo(2);
>>> f(2)
true
```

Select the numbers that are equal to zero:

```
>>> [-1 0 1E-10 1 0.0].select(
>>> 	equalTo(0)
>>> )
[0 0.0]
```

* * *

See also: =

Guides: Comparison Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/EqualTo.html)
