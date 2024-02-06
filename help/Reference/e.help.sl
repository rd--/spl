# e

Mathematical constant.
The number e, also known as Eulers number, is a mathematical constant approximately equal to 2.71828.
It is the base of natural logarithms.

- _e(aNumber)_

Answer _aNumber_ times e.

	1.e = 2.718281828459045
	2.e = 5.43656365691809

- _e(aBlock:/2)_

Answer a Block that will apply _aBlock_ element wise to two sequences of equal length.

```
>>> ['1' '2' '3'] ++.e ['4' '5' '6']
['14' '25' '36']

>>> ['1' '2' '3'].withCollectEqual(['4' '5' '6'], ++)
['14' '25' '36']
```

It is an error if the sequences are not of equal size:

```
>>> { [1 2 3] +.e [4 5] }.ifError { true }
true
```

* * *

See also: pi, [Operator Adverbs], withCollectEqual

References:
_Mathematica_
[1](https://mathworld.wolfram.com/e.html)

Categories: Math
