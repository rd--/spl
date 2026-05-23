# octaveReduce

- _octaveReduce(n/d, o=2)_

Answer the `Fraction` _n/d_ reduced to lie within `one` and the octave specified by the number _o_.

At `Fraction`:

```
>>> (3/2 ^ 2).octaveReduce
9/8

>>> (3/2 ^ 12).octaveReduce
1.pythagoreanComma

>>> { :x |
>>> 	(x * 3/2).octaveReduce
>>> }.nestList(1/1, 5)
[1/1 3/2 9/8 27/16 81/64 243/128]
```

A succession of fifty-three just fifths approximates thirty-one octaves,
for comparison the Pythagorean comma is 23.5¢:

```
>>> ((3/2 ^ 53) / (2 ^ 31)).ratioToCents
3.615

>>> (3/2 ^ 53).octaveReduce
>>> .ratioToCents
3.615

>>> (3/2 ^ 12).octaveReduce
>>> .ratioToCents
23.460
```

The octave is not included:

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
```

At `Integer`:

```
>>> 3.octaveReduce
3/2
```

It is an error to try and octave reduce a real number:

```
>>> {
>>> 	3.141.octaveReduce
>>> }.hasError
true
```

Log scale plot of octave reduced powers of _3/2_,
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

* * *

See also: ^, log2

Guides: Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Octave),
_Xenharmonic_
[1](https://en.xen.wiki/w/Octave_reduction)

Categories: Tuning
