# octaveReduced

- _octaveReduced(n/d, o=2)_

Answer the `Fraction` _n/d_ reduced to lie within `one` and the octave specified by the number _o_.

At `Fraction`:

```
>>> (3/2 ^ 2).octaveReduced(2)
9/8

>>> (3/2 ^ 12).octaveReduced(2)
1.pythagoreanComma
```

Threads over lists:

```
>>> [3/4 5/2].octaveReduced
[3/2 5/4]
```

At `Integer`:

```
>>> 3.octaveReduced
3/2
```

It is an error to try and octave reduce a real number:

```
>>> {
>>> 	3.141.octaveReduced
>>> }.ifError { true }
true
```

* * *

See also: ^, log2

Guides: Xenharmonic Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Octave_reduction)

Categories: Tuning
