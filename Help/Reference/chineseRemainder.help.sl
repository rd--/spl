# chineseRemainder

- _chineseRemainder(r, m)_

Answer the smallest _x_ with _x >= 0_ that satisfies all the integer congruences _x%m(i) = r(i)%m(i)_.

The smallest positive integer _x_ that satisfies _x%4 = 3_ and _x%5 = 4_:

```
>>> [3 4].chineseRemainder([4 5])
19
```

Find the smallest positive integer giving remainders _2,3,5_ when divided by _3,5,7_:

```
>>> [2 3 5].chineseRemainder([3 5 7])
68
```

Define a residue number system,
define two numbers and their representation in the residue system,
and demonstrate both multiplying & recovering and adding & recovering:

```
>>> let m = 100:103.prime;
>>> let n1 = 123456787;
>>> let n2 = 123;
>>> let n1r = n1 % m;
>>> let n2r = n2 % m;
>>> let cr1 = (n1r * n2r).chineseRemainder(m);
>>> let cr2 = (n1r + n2r).chineseRemainder(m);
>>> (n1r, n2r, n1 * n2, cr1, n1 + n2, cr2)
(
	[46 528 522 458], [123 123 123 123],
	15185184801, 15185184801,
	123456910, 123456910
)
```

* * *

See also: gcd

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ChineseRemainderTheorem.html)
[2](https://reference.wolfram.com/language/ref/ChineseRemainder.html)

Categories: Math
