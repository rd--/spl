# cos

- _cos(aNumber)_

Answers the cosine of _aNumber_.

```
>>> (pi / 6).cos
(3.sqrt / 2)

>>> (pi / 5).cos
(1 + 5.sqrt) / 4

>>> 30.degrees.cos
(3.sqrt / 2)

>>> 1.2.cos
0.362358
```

`cos` can take `Complex` number inputs:

```
>>> 2.5j1.cos
-1.23623j-0.70333
```

Threads elementwise over lists and matrices:

```
>>> [1.2 1.5 1.8].cos
[0.36236 0.07074 -0.22720]
```

Fixed point:

```
>>> 0.7390851332.cos
0.7390851332
```

Plot over a subset of the reals:

~~~
(0 -- 2.pi).functionPlot(cos:/1)
~~~

Increasing amplitude:

~~~
(0 -- 16.pi).functionPlot { :u | u * u.cos }
~~~

Noncommensurate waves (quasiperiodic function):

~~~
(0 -- 40.pi).functionPlot { :x | x.cos + (x * 2.sqrt).cos }
~~~


Spiral:

~~~
(0 -- 6.pi).functionPlot { :t |
	[
		t / pi * t.cos,
		t / pi * t.sin
	]
}
~~~

* * *

See also: arcCos, sin, tan

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Cosine.html)
[2](https://reference.wolfram.com/language/ref/Cos.html),
_Smalltalk_
5.6.7.5

Categories: Math, Trigonometry
