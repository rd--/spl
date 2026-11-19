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
0:92.collect(a/1).discretePlot
~~~

![](Help/Image/which-A.svg)

Earliest sequence with _a(a(n))=6n_,
OEIS [A054786](https://oeis.org/A054786):

~~~spl svg=B oeis=A054786
let a = Map { :n |
	let m = n % 12L;
	[
		{ [0L 6L].includes(m) } -> {
			6L * a[n // 6L]
		},
		{ [1L 3L 8L 10L].includes(m) } -> {
			n + 1L
		},
		{ [2L 4L 9L 11L].includes(m) } -> {
			6L * n - 6L
		},
		{ m = 5L } -> {
			n + 1L
		},
		{ m = 7L } -> {
			6L * n - 12L
		}
	].which
};
a[1L .. 115L].scatterPlot
~~~

![](Help/Image/which-B.svg)

* * *

See also: caseOf, if

Guides: Control Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Which.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Function.html#-case)
