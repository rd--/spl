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

An even number is divisible by two,
the modulo of an even number and two is zero:

```
>>> [2 4 6 8] % 2
[0 0 0 0]
```

The sum or difference of two integers with equal parity is even:

```
>>> (13 - 7).isEven
true

>>> (14 + 28).isEven
true
```

The product of two integers is even if either or both is even:

```
>>> (13 * 28).isEven
true

>>> (4 * 12).isEven
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
5.6.5.10,
_W_
[1](https://en.wikipedia.org/wiki/Even_number)

Categories: Testing, Math
