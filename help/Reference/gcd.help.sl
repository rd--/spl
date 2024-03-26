# gcd

- _gcd(aCollection)_
- _gcd(aNumber, anotherNumber)_

Greatest common divisor.

```
>>> 0.gcd(9)
9

>>> [2 6 10].reduce(gcd:/2)
2

>>> [2 6 10].gcd
2

>>> [-12 9 57].gcd
3

>>> [1/3 2/5 3/7].gcd
1/105
```

The one-argument form is identity for positive integers & an error for empty collections:

```
>>> [5].gcd
5

>>> { [].gcd }.ifError { true }
true
```

Gcd threads elementwise over lists:

```
>>> [3 7 40].collect { :each | 12.gcd(each) }
[3 1 4]

>>> [3 7 40].gcd(12)
[3 1 4]

>>> 12.gcd([3 7 40])
[3 1 4]
```

Compute for large integers:

```
>>> [20n.factorial, 10n ^ 100 + 3].gcd
7n
```

Plot the gcd for a number with 12:

~~~
1:100.gcd(12).plot
~~~

* * *

See also: euclideanAlgorithm, extendedGcd, lcm

References:
_Apl_
[1](https://aplwiki.com/wiki/GCD),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/plusdot#dyadic),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:gcd),
_Mathematica_
[1](https://mathworld.wolfram.com/GreatestCommonDivisor.html)
[2](https://mathworld.wolfram.com/GCD.html),
_Smalltalk_
5.6.5.12
