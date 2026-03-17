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

Least sequence of lengths one through five,
OEIS [A151959](https://oeis.org/A151959)

```
>>> 0.kaprekarSequence
[0]

>>> 53955.kaprekarSequence
[53955 59994]

>>> 64308654.kaprekarSequence
[64308654 83208762 86526432]

>>> 61974.kaprekarSequence
[61974 82962 75933 63954]

>>> 86420987532.kaprekarSequence
[
	86420987532
	96641975331
	88431976512
	87641975322
	86541975432
]
```

Sequence of length seven:

```
>>> 420876.kaprekarSequence
[420876 851742 750843 840852 860832 862632 642654]
```

Smallest number that leads to a new fixed point under the base-two Kaprekar map,
OEIS [A164887](https://oeis.org/A164887):

```
>>> let a = [];
>>> let b = IdentitySet();
>>> 0:1000.collect { :n |
>>> 	let p = n.kaprekarSequence(2);
>>> 	let q = p.last;
>>> 	b.includes(q).ifFalse {
>>> 		a.add(n);
>>> 		b.add(q)
>>> 	}
>>> };
>>> a
[
	  0   9  17  33  35
	 65  67 129 131 135
	257 259 263 513 515
	519 527
]
```

Plot the number of steps required for the Kaprekar routine to reach a fixed point,
fixing the length of the integer digits of _x_ to four,
partitioned into a 100×100 matrix:

~~~spl png=A
0:9999.collect { :x |
	x.kaprekarSequence(10, 4).size
}.reshape([100 100]).rescale.Greymap
~~~

![](Help/Image/kaprekarSequence-A.png)

The Kaprekar binary numbers in decimal,
OEIS [A160761](https://oeis.org/A160761):

~~~spl svg=B oeis=A160761
0:100.collect { :n |
	n.kaprekarSequence(2).last
}.without(0).stepPlot
~~~

![](Help/Image/kaprekarSequence-B.svg)

* * *

See also: fromDigits, integerDigits, kaprekarMap, sort

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/KaprekarRoutine.html)
[2](https://mathworld.wolfram.com/KaprekarsConstant.html),
_OEIS_
[1](http://oeis.org/A099009)
[2](http://oeis.org/A099010),
_W_
[1](https://en.wikipedia.org/wiki/Kaprekar%27s_routine)
