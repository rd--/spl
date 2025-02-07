# nestWhileList

- _nestWhileList(aBlock:/1, anObject, aPredicate:/1)_

Answer a `List` of the results of applying _aBlock_ repeatedly,
starting with _anObject_,
and continuing until applying _aPredicate_ to the result no longer yields `true`.

Keep dividing by 2 until the result is no longer an even number:

```
>>> { :x |
>>> 	x / 2
>>> }.nestWhileList(123456, isEven:/1)
[123456 61728 30864 15432 7716 3858 1929]
```

Iterate taking logarithms until the result is no longer positive:

```
>>> log:/1.nestWhileList(100, isPositive:/1)
[100 4.60517 1.52718 0.42342 -0.85938]
```

Continue until the result is no longer greater than 1:

```
>>> { :x |
>>> 	(x / 2).floor
>>> }.nestWhileList(20) { :x |
>>> 	x > 1
>>> }
[20 10 5 2 1]
```

Find successive integers until a prime is reached:

```
>>> { :x |
>>> 	x + 1
>>> }.nestWhileList(899) { :x |
>>> 	x.isPrime.not
>>> }
[899 900 901 902 903 904 905 906 907]
```

Find the multiplicative order of 2 modulo 19:

```
>>> { :x |
>>> 	(x * 2) % 19
>>> }.nestWhileList(2) { :x |
>>> 	x ~= 1
>>> }
[2 4 8 16 13 7 14 9 18 17 15 11 3 6 12 5 10 1]
```

* * *

See also: iterate, nestList, takeWhile

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NestWhileList.html)

Categories: Enumerating
