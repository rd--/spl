# octaveReduce

- _octaveReduce(n/d, o=2)_

Answer the `Fraction` _n/d_ reduced to lie within `one` and the octave specified by the number _o_.

At `Fraction`,
two just fifths reduces to a whole tone:

```
>>> (3/2 ^ 2).octaveReduce
9/8

>>> 3/2 ^ 2
9/4

>>> (3/2 ^ 2) / (2/1 ^ 1)
9/8
```

Three just fifths reduces to a major sixth:

```
>>> (3/2 ^ 3).octaveReduce
27/16

>>> 3/2 ^ 3
27/8

>>> (3/2 ^ 3) / (2/1 ^ 1)
27/16
```

Four just fifths reduces to a major third:

```
>>> (3/2 ^ 4).octaveReduce
81/64

>>> 3/2 ^ 4
81/16

>>> (3/2 ^ 4) / (2/1 ^ 2)
81/64
```

Twelve just fifths reduces to a Pythagorean comma:

```
>>> (3/2 ^ 12).octaveReduce
1.pythagoreanComma

>>> 3/2 ^ 12
531441/4096

>>> (3/2 ^ 12) / (2/1 ^ 7)
1.pythagoreanComma
```

The first entries of the circle of just fifths:

```
>>> { :x |
>>> 	(x * 3/2).octaveReduce
>>> }.nestList(1/1, 5)
[1/1 3/2 9/8 27/16 81/64 243/128]
```

A succession of fifty-three just fifths approximates thirty-one octaves,
for comparison the Pythagorean comma is 23.5¢:

```
>>> (3/2 ^ 53).octaveReduce
1.mercatorsComma

>>> ((3/2 ^ 53) / (2 ^ 31))
>>> .ratioToCents
3.615

>>> (3/2 ^ 12).octaveReduce
>>> .ratioToCents
23.460
```

The octave is not included,
that is it is reduced to a unison:

```
>>> 2/1.octaveReduce
1/1
```

Threads over lists:

```
>>> [3/4 5/2].octaveReduce
[3/2 5/4]

>>> { :x | (x * 3/2) }
>>> .nestList(1/1, 5)
>>> .octaveReduce
[1/1 3/2 9/8 27/16 81/64 243/128]

>>> (3/2 ^ -4:7).octaveReduce
[
	128/81 32/27 16/9 4/3
	1/1
	3/2 9/8 27/16 81/64 243/128 729/512 2187/2048
]
```

At `Integer`:

```
>>> 3.octaveReduce
3/2

>>> 33.octaveReduce.intervalName
'undecimal comma, al-Farabi’s 1/4-tone'
```

It is an error to try and octave reduce a real number:

```
>>> {
>>> 	3.141.octaveReduce
>>> }.hasError
true
```

Log scale plot of octave reduced powers of _3/2_ in cents,
note that _3/2^53_ is very close to `zero`,
3.6¢:

~~~spl svg=A
(3/2 ^ 1:99)
.octaveReduce
.ratioToCents
.scatterPlot
.log
~~~

![](Help/Image/octaveReduce-A.svg)

Linear scale plot of octave reduced powers of _3/2_ in cents:

~~~spl svg=B
(3/2 ^ 1:99)
.octaveReduce
.ratioToCents
.scatterPlot
~~~

![](Help/Image/octaveReduce-B.svg)

Linear scale plot of octave reduced powers of _3/2_:

~~~spl svg=C
(3/2 ^ 1:99)
.octaveReduce
.scatterPlot
~~~

![](Help/Image/octaveReduce-C.svg)

* * *

See also: ^, log2

Guides: Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Octave),
_Xenharmonic_
[1](https://en.xen.wiki/w/Octave_reduction)

Categories: Tuning
