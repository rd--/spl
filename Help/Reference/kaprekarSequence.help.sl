# kaprekarSequence

- _kaprekarSequence(n, b=10, k)_

Answer the Kaprekar sequence of _n_ in base _b_.

Sequences arriving at Kaprekar’s constant, 6174:

```
>>> 1234L.kaprekarSequence
[1234 3087 8352 6174]

>>> [
>>> 	4321 - 1234,
>>> 	8730 - 0378,
>>> 	8532 - 2358,
>>> 	7614 - 1467
>>> ]
[3087 8352 6174 6147]

>>> 8991L.kaprekarSequence
[8991 8082 8532 6174]

>>> 3524L.kaprekarSequence
[3524 3087 8352 6174]
```

Perfect digital invariants, sequence length of one:

```
>>> 495L.kaprekarSequence
[495]

>>> 549945L.kaprekarSequence
[549945]

>>> 631764L.kaprekarSequence
[631764]
```

Least sequence of lengths one through five,
OEIS [A151959](https://oeis.org/A151959)

```
>>> 0L.kaprekarSequence
[0]

>>> 53955L.kaprekarSequence
[53955 59994]

>>> 64308654L.kaprekarSequence
[64308654 83208762 86526432]

>>> 61974L.kaprekarSequence
[61974 82962 75933 63954]

>>> 86420987532L.kaprekarSequence
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
>>> 420876L.kaprekarSequence
[420876 851742 750843 840852 860832 862632 642654]
```

Smallest number that leads to a new fixed point under the base-two Kaprekar map,
OEIS [A164887](https://oeis.org/A164887):

```
>>> let a = [];
>>> let b = SortedSet();
>>> 0L:1000L.collect { :n |
>>> 	let p = n.kaprekarSequence(2L);
>>> 	let q = p.last;
>>> 	b.includes(q).ifFalse {
>>> 		a.add!(n);
>>> 		b.add!(q)
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
0L:9999L.collect { :x |
	x.kaprekarSequence(10L, 4L).size
}.reshape([100 100]).rescale.Greymap
~~~

![](Help/Image/kaprekarSequence-A.png)

The Kaprekar binary numbers in decimal,
OEIS [A160761](https://oeis.org/A160761):

~~~spl svg=B oeis=A160761
0L:100L.collect { :n |
	n.kaprekarSequence(2L).last
}.without!(0L).stepPlot
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
