# sin

- _sin(z)_

Answers the sin of _z_.

```
>>> (pi / 3).sin
(3.sqrt / 2)

>>> (pi / 5).sin
((5 / 8) - (5.sqrt / 8)).sqrt

>>> 60.degrees.sin
(3.sqrt / 2)
```

Prefix notation:

```
>>> sin(1.2)
0.932039
```

`sin` can take `Complex` number inputs:

```
>>> 2.5j1.sin
0.923491j-0.941505
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].sin
[0.932039 0.997495 0.973848]
```

Values of `sin` at fixed points:

```
>>> 0:6.collect { :n | (n.pi / 6).sin }
[0, 1 / 2, 3.sqrt / 2, 1, 3.sqrt / 2, 1 / 2, 0]
```

`sin` is an odd function:

```
>>> let n = (0 -- 2.pi).atRandom;
>>> n.negated.sin
n.sin.negated
```

`sin` has the mirror property:

```
>>> let n = (0 -- 2.pi).atRandom.j(1);
>>> n.conjugated.sin
n.sin.conjugated
```

Fixed point:

```
>>> 0.sin
0
```

Plot over a subset of the reals:

~~~
(0, 0.05 .. 2 * pi).sin.plot
~~~

Noncommensurate waves (quasiperiodic function):

~~~
(0, 0.1 .. 40 * pi).collect { :x | x.sin + (x * 2.sqrt).sin }.plot
~~~

* * *

See also: arcSin, cos, haversine, tan

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Sine.html)
[2](https://reference.wolfram.com/language/ref/Sin.html),
_Smalltalk_
5.6.7.13

Categories: Math, Trigonometry
