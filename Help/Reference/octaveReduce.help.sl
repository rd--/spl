# octaveReduce

- _octaveReduce(n/d, o=2)_

Answer the `Fraction` _n/d_ reduced to lie within `one` and the octave specified by the number _o_.

At `Fraction`,
two just fifths reduces to a whole tone:

```
>>> (3/2 ^ 2L).octaveReduce
9/8

>>> 3/2 ^ 2L
9/4

>>> (3/2 ^ 2L) / (2/1 ^ 1L)
9/8
```

Three just fifths reduces to a major sixth:

```
>>> (3/2 ^ 3L).octaveReduce
27/16

>>> 3/2 ^ 3L
27/8

>>> (3/2 ^ 3L) / (2/1 ^ 1L)
27/16
```

Four just fifths reduces to a major third:

```
>>> (3/2 ^ 4L).octaveReduce
81/64

>>> 3/2 ^ 4L
81/16

>>> (3/2 ^ 4L) / (2/1 ^ 2L)
81/64
```

Twelve just fifths reduces to a Pythagorean comma:

```
>>> (3/2 ^ 12L).octaveReduce
1L.pythagoreanComma

>>> 3/2 ^ 12L
531441/4096

>>> (3/2 ^ 12L) / (2/1 ^ 7L)
1L.pythagoreanComma
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
>>> (3/2 ^ 53L).octaveReduce
1L.mercatorsComma

>>> ((3/2 ^ 53L) / (2L ^ 31L))
>>> .ratioToCents
3.615

>>> (3/2 ^ 12L).octaveReduce
>>> .ratioToCents
23.460
```

The octave is not included,
that is it is reduced to a unison:

```
>>> 2L.octaveReduce
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

>>> (3/2 ^ -4L:7L).octaveReduce
[
	128/81 32/27 16/9 4/3
	1/1
	3/2 9/8 27/16 81/64 243/128 729/512 2187/2048
]
```

At `Integer`:

```
>>> 3L.octaveReduce
3/2

>>> 33L.octaveReduce.intervalName
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
(3/2 ^ 1L:99L)
.octaveReduce
.ratioToCents
.scatterPlot
.log
~~~

![](Help/Image/octaveReduce-A.svg)

Linear scale plot of octave reduced powers of _3/2_ in cents:

~~~spl svg=B
(3/2 ^ 1L:99L)
.octaveReduce
.ratioToCents
.scatterPlot
~~~

![](Help/Image/octaveReduce-B.svg)

Linear scale plot of octave reduced powers of _3/2_:

~~~spl svg=C
(3/2 ^ 1L:99L)
.octaveReduce
.scatterPlot
~~~

![](Help/Image/octaveReduce-C.svg)

* * *

See also: ^, log2

Guides: Tuning Functions, Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Octave),
_Xenharmonic_
[1](https://en.xen.wiki/w/Octave_reduction)
