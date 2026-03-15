# which

- _which([p₁ → f₁, p₂ → f₂, …])_

Iterate over an association list and answer the value of the block _f_ associated with the first key _p_ whose value is `true`.
If no clause answers `true`, answer `nil`.

```
>>> let a = 2;
>>> [
>>> 	{ a = 1 } -> { 'x' },
>>> 	{ a = 2 } -> { 'b' }
>>> ].which
'b'
```

Use `true` for an else clause that always matches:

```
>>> [-2 0 3].collect { :x |
>>> 	[
>>> 		{ x < 0 } -> { -1 },
>>> 		{ x > 0 } -> { 1 },
>>> 		{ true } -> { 0 }
>>> 	].which
>>> }
[-1 0 1]
```

Implement the Ackerman function:

```
>>> let a = { :m :n |
>>> 	[
>>> 		{ m = 0 } -> { n + 1 },
>>> 		{ m = 1 } -> { n + 2 },
>>> 		{ m = 2 } -> {
>>> 			3 + (2 * n)
>>> 		},
>>> 		{ m = 3 } -> {
>>> 			5 + (8 * ((2 ^ n) - 1))
>>> 		},
>>> 		{ n = 0 } -> {
>>> 			a(m - 1, 1)
>>> 		},
>>> 		{ true } -> {
>>> 			a(m - 1, a(m, n - 1))
>>> 		}
>>> 	].which
>>> };
>>> 0:3.collect { :m |
>>> 	0:8.collect { :n |
>>> 		a(m, n)
>>> 	}
>>> }
[
	1 2 3 4 5 6 7 8 9;
	2 3 4 5 6 7 8 9 10;
	3 5 7 9 11 13 15 17 19;
	5 13 29 61 125 253 509 1021 2045
]
```

The regular paper-folding sequence,
OEIS [A014707](https://oeis.org/A014707):

~~~spl svg=A oeis=A014707
let a = { :n |
	[
		{ n % 4 = 0 } -> { 0 },
		{ n % 4 = 2 } -> { 1 },
		{ n % 2 = 1 } -> {
			let m = (n - 1) // 2;
			a(m)
		}
	].which
};
0:92.collect(a:/1).discretePlot
~~~

![](sw/spl/Help/Image/which-A.svg)

Earliest sequence with _a(a(n))=6n_,
OEIS [A054786](https://oeis.org/A054786):

~~~spl svg=B oeis=A054786
let a = Map { :n |
	let m = n % 12;
	[
		{ [0 6].includes(m) } -> {
			6 * a[n/6]
		},
		{ [1 3 8 10].includes(m) } -> {
			n + 1
		},
		{ [2 4 9 11].includes(m) } -> {
			6 * n - 6
		},
		{ m = 5 } -> {
			n + 1
		},
		{ m = 7 } -> {
			6 * n - 12
		}
	].which
};
a[1:115].scatterPlot
~~~

![](sw/spl/Help/Image/which-B.svg)

* * *

See also: caseOf, if

Guides: Control Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Which.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Function.html#-case)

Categories: Casing
