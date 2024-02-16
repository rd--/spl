# sin

_sin(z)_

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

Sin can take complex number inputs:

```
>>> 2.5j1.sin
0.923491j-0.941505
```

Sin threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].sin
[0.932039 0.997495 0.973848]
```

Values of sin at fixed points:

```
>>> 0:6.collect { :n | (n.pi / 6).sin }
[0, 1 / 2, 3.sqrt / 2, 1, 3.sqrt / 2, 1 / 2, 0]
```

Sin is an odd function:

```
>>> let n = 2.pi.randomFloat; n.negated.sin = n.sin.negated
true
```

Sin has the mirror property:

```
>>> let n = 2.pi.randomFloat.j(1); n.conjugated.sin = n.sin.conjugated
true
```

Fixed point:

```
>>> 0.sin
0
```

* * *

See also: cos, tan

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Sine.html)
[2](https://reference.wolfram.com/language/ref/Sin.html)

Categories: Trigonometry
