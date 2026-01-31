# fermatQuotient

- _fermatQuotient(a, p)_

Answer the Fermat quotient of the integer _a_ with respect to the odd prime _p_.

With _a=10_ and _p=7_:

```
>>> 10.fermatQuotient(7)
142857

>>> 2:6 * 142857
[
	285714
	428571
	571428
	714285
	857142
]

>>> (2:6 * 142857)
>>> .integerDigits
>>> .collect { :x |
>>> 	x.findRotation([1 4 2 8 5 7])
>>> }
[4 5 2 1 3]
```

With _a=10_ and _p=17_:

```
>>> 10.fermatQuotient(17)
588235294117647

>>> 2:16 * 0588235294117647
[
	1176470588235294
	1764705882352941
	2352941176470588
	2941176470588235
	3529411764705882
	4117647058823529
	4705882352941176
	5294117647058823
	5882352941176470
	6470588235294117
	7058823529411764
	7647058823529411
	8235294117647058
	8823529411764705
	9411764705882352
]

>>> let n = 0588235294117647;
>>> let d = [0 5 8 8 2 3 5 2 9 4 1 1 7 6 4 7];
>>> (2:16 * 0588235294117647)
>>> .integerDigits
>>> .collect { :x |
>>> 	x.findRotation(d)
>>> }
[6 5 12 9 11 7 2 10 15 3 1 4 13 14 8]
```

The quotient with _a=2_ is known to be congruent to `zero` _(mod p)_ for only two primes,
the Wieferich primes 1093 and 3511:

```
>>> [1093L 3511L].collect { :p |
>>> 	2.fermatQuotient(p) % p
>>> }
[0 0]
```

Primes _p_ that give cyclic numbers in base _a_ are called full reptend primes, or long primes, in base _a_:

```
>>> 7.isFullReptendPrime(10)
true

>>> 17.isFullReptendPrime(10)
true
```

* * *

See also: isFullReptendPrime

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FermatQuotient.html),
_W_
[1](https://en.wikipedia.org/wiki/Fermat_quotient)
[2](https://en.wikipedia.org/wiki/Cyclic_number)

