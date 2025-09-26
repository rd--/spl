# isEven

- _isEven(n)_

Answer `true` if the number _n_ is an even integer, else `false`.

Test whether integers are even:

```
>>> 8.isEven
true

>>> 5.isEven
false

>>> 1:5.collect(isEven:/1)
[false true false true false]

>>> 1:5.allSatisfy(isEven:/1)
false
```

At `zero`:

```
>>> 0.isEven
true
```

Non-integers are never even:

```
>>> 1.pi.isEven
false
```

* * *

See also: divisible, isInteger, isOdd

Guides: Integer Functions, Number Functions, Predicate Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/EvenQ.html),
_Smalltalk_
5.6.5.10

Categories: Testing, Math
