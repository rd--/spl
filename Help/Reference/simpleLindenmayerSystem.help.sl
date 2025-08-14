# simpleLindenmayerSystem

- _simpleLindenmayerSystem(v, [θ₁ θ₂], p, ω, n)_

Implement a deterministic context-free L-system.
_v_ is the alphabet,
θ₁ and θ₂ are angles in radians,
_p_ is the list of production rules,
_ω_ is the initial term or axiom,
and _n_ is the iteration count.

Draw a Koch curve:

~~~spl svg=A
'F'.simpleLindenmayerSystem(
	[1/3.pi -1/3.pi],
	[
		'F' -> 'F+F--F+F'
	],
	'F',
	4
).Line
~~~

![](sw/spl/Help/Image/simpleLindenmayerSystem-A.svg)

The underlying substitution system:

```
>>> [
>>> 	'+' -> '+',
>>> 	'-' -> '-',
>>> 	'F' -> 'F+F--F+F'
>>> ].substitutionSystem('F', 2).last
[
	'F+F--F+F+F+F--F+F'
	'--'
	'F+F--F+F+F+F--F+F'
].stringJoin
```

A branching system:

~~~spl svg=B
'F'.simpleLindenmayerSystem(
	[1/2.pi -1/2.pi],
	[
		'F' -> 'FF+F++F+F'
	],
	'F+F+F+F',
	3
).Line
~~~

![](sw/spl/Help/Image/simpleLindenmayerSystem-B.svg)

A Sierpiński pentagon:

~~~spl svg=C
'F'.simpleLindenmayerSystem(
	[1/5.pi -1/5.pi],
	[
		'F'
		->
		'F++F++F+++++F-F++F'
	],
	'F++F++F++F++F',
	2
).Line
~~~

![](sw/spl/Help/Image/simpleLindenmayerSystem-C.svg)

* * *

See also: substitutionSystem

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LindenmayerSystem.html),
_W_
[1](https://en.wikipedia.org/wiki/L-system)
