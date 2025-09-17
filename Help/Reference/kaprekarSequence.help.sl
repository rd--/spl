# kaprekarSequence

- _kaprekarSequence(n, b=10, k)_

Answer the Kaprekar sequence of _n_ in base _b_.

Sequences arriving at Kaprekar’s constant, 6174:

```
>>> 1234.kaprekarSequence
[1234 3087 8352 6174]

>>> [
>>> 	4321 - 1234,
>>> 	8730 - 0378,
>>> 	8532 - 2358,
>>> 	7614 - 1467
>>> ]
[3087 8352 6174 6147]

>>> 8991.kaprekarSequence
[8991 8082 8532 6174]

>>> 3524.kaprekarSequence
[3524 3087 8352 6174]
```

Perfect digital invariants, sequence length of one:

```
>>> 495.kaprekarSequence
[495]

>>> 549945.kaprekarSequence
[549945]

>>> 631764.kaprekarSequence
[631764]
```

Sequence length of two:

```
>>> 53955.kaprekarSequence
[53955 59994]

>>> 59994.kaprekarSequence
[59994 53955]
```

Sequence length of four:

```
>>> 62964.kaprekarSequence
[62964 71973 83952 74943]

>>> 63954.kaprekarSequence
[63954 61974 82962 75933]

>>> 71973.kaprekarSequence
[71973 83952 74943 62964]
```

Plot the number of steps required for the Kaprekar routine to reach a fixed point,
fixing the length of the integer digits of _x_ to four,
partitioned into a 100×100 matrix:

~~~spl png=A
0:9999.collect { :x |
	x.kaprekarSequence(10, 4).size
}.reshape([100 100]).rescale.Graymap
~~~

![](sw/spl/Help/Image/kaprekarSequence-A.png)

* * *

See also: fromDigits, integerDigits, sort

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/KaprekarRoutine.html)
[2](https://mathworld.wolfram.com/KaprekarsConstant.html),
_OEIS_
[1](http://oeis.org/A099009)
[2](http://oeis.org/A099010),
_W_
[1](https://en.wikipedia.org/wiki/Kaprekar%27s_routine)
