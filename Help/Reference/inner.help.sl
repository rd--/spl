# inner

- _inner(f:/2, g:/2)_
- _inner(f:/2, α, β, g:/2)_

`inner` is a generalization of `dot` in which _f_ plays the role of multiplication and _g_ of addition.

```
>>> inner(*, [1 1], [-1 1], +)
0

>>> let m = [1 2; 3 4; 5 6];
>>> let n = [6 5 4; 3 2 1];
>>> (inner(*, m, n, +), inner(*, n, m, +))
(
	[
		12  9  6;
		30 23 16;
		48 37 26
	],
	[
		41 56;
		14 20
	]
)
```

Generalized inner product of:

- two vectors
- a matrix and a vector
- a vector and a matrix
- two matrices

```
>>> let f = { :l |
>>> 	{ :x :y |
>>> 		l ++ '(' ++ (x ++ y) ++ ')'
>>> 	}
>>> };
>>> let h = { :p :q |
>>> 	inner(f('f'), p, q, f('g'))
>>> };
>>> (
>>> 	h(['a' 'b'], ['x' 'y']),
>>> 	h(['a' 'b'; 'c' 'd'], ['s' 't']),
>>> 	h(['x' 'y'], ['a' 'b'; 'c' 'd']),
>>> 	h(['a' 'b'; 'c' 'd'], ['u' 'v'; 'w' 'x'])
>>> )
(
	'g(f(ax)f(by))',
	[
		'g(f(as)f(bt))'
		'g(f(cs)f(dt))'
	],
	[
		'g(f(xa)f(yc))'
		'g(f(xb)f(yd))'
	],
	[
		'g(f(au)f(bw))' 'g(f(av)f(bx))';
		'g(f(cu)f(dw))' 'g(f(cv)f(dx))'
	]
)
```

Evaluate symbolically:

```
>> *.inner([𝒂 𝒃], [𝒙 𝒚], +)
(+ (* a x) (* b y))

>> *.inner([𝒂 𝒃; 𝒄 𝒅], [𝒔 𝒕], +)
[(+ (* a s) (* b t)), (+ (* c s) (* d t))]

>> *.inner([𝒙 𝒚], [𝒂 𝒃; 𝒄 𝒅], +)
[(+ (* x a) (* y c)), (+ (* x b) (* y d))]

>>> *.inner(
>>> 	[𝒂 𝒃; 𝒄 𝒅],
>>> 	[𝒖 𝒗; 𝒘 𝒙],
>>> 	+
>>> ).deepCollect(printString:/1)
[
	[
		'(+ (* a u) (* b w))',
		'(+ (* a v) (* b x))'
	],
	[
		'(+ (* c u) (* d w))',
		'(+ (* c v) (* d x))'
	]
]
```

The binary form is _adverbial_, it answers a `Block` that will perform _inner(f, α, β, g)_.

```
>>> [1 1] *.inner(+) [-1 1]
0

>>> let m = [0 0 1; 1 0 0; 0 1 0];
>>> m *.inner(+) m.transpose
[
	1 0 0;
	0 1 0;
	0 0 1
]

>>> let x = [1 3 -5];
>>> let y = [4 -2 -1];
>>> (x * y, x *.inner(+) y)
([4 -6 5], 3)
```

* * *

See also: dot, outer

References:
_Apl_
[1](https://aplwiki.com/wiki/Inner_Product),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/dot#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/InnerProduct.html)
[2](https://reference.wolfram.com/language/ref/Inner.html)

Categories: Math, Matrix
