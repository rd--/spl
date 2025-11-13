# DyckWord

- _DyckWord([x₁ x₂ …], [a b]=[1 0])_

A `Type` representing a Dyck word.

On the letters _1,-1_:

```
>>> DyckWord([1 1 -1 1 -1 -1 1 -1], [1 -1])
>>> .heights
[0 1 2 1 2 1 0 1 0]
```

Plot heights:

~~~spl svg=A
DyckWord(
	[
		1 0 1 1 1 1 0 1 0 0
		1 0 1 1 0 1 0 1 1 0
		0 0 0 0
	],
	[1 0]
).heights.linePlot
~~~

![](sw/spl/Help/Image/DyckWord-A.svg)

* * *

See also: dyckWords, isDyckWord

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DyckLanguage.html)
[2](https://mathworld.wolfram.com/DyckPath.html),
_W_
[1](https://en.wikipedia.org/wiki/Dyck_language)
