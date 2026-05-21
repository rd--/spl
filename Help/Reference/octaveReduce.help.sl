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

* * *

See also: ^, log2

Guides: Xenharmonic Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Octave),
_Xenharmonic_
[1](https://en.xen.wiki/w/Octave_reduction)

Categories: Tuning
