# caseOf

- _caseOf(x, [y₁ → f₁, y₂ → f₂, …], f)_

Compare _x_ to each _y_ in turn,
evaluating the corresponding `Block` _f_ associated with the first item that matches.

The keys of the associations, _y_, are values that are to be compared with _x_ using `=`.
The values of the associations are blocks to be evaluated when a case matches.

Even if the answer values are constant they must be placed in blocks:

```
>>> let x = 'b';
>>> let c = [
>>> 	'a' -> { 1 },
>>> 	'b' -> { 2 },
>>> 	'c' -> { 3 }
>>> ];
>>> x.caseOf(c)
2
```

With non-constant blocks:

```
>>> let x = 'b';
>>> let c = [
>>> 	'a' -> { 1 * 1 },
>>> 	'b' -> { 2 * 2 },
>>> 	'c' -> { 3 * 3 }
>>> ];
>>> x.caseOf(c)
4
```

If no match is found, answer the result of evaluating the _otherwise_ clause:

```
>>> let c = [
>>> 	'a' -> { 1 },
>>> 	'b' -> { 2 },
>>> 	'c' -> { 3 }
>>> ];
>>> 'd'.caseOf(c, identity:/1)
'd'
```

If no match is found, and no _otherwise_ clause is given, report an `error`:

```
>>> let c = [
>>> 	'a' -> { 1 },
>>> 	'b' -> { 2 },
>>> 	'c' -> { 3 }
>>> ];
>>> {
>>> 	'd'.caseOf(c)
>>> }.hasError
true
```

Using a `Record` to select a `String` key,
written using `Trailing Record Syntax`:

```
>>> 'y'.caseOf (
>>> 	x: { 1 },
>>> 	y: { 2 },
>>> 	z: { 3 }
>>> )
2
```

If the collection _c_ does not contain associations, report an `error`:

```
>>> {
>>> 	'x'.caseOf(['x' 'y' 'z'])
>>> }.hasError
true
```

Plot problem related to gerrymandering,
OEIS [A290323](https://oeis.org/A290323):

~~~spl svg=A
let f = { :p :e |
	(p = 2).if {
		(e = 1).if {
			2
		} {
			(e % 3).caseOf(
				[
					1 -> { 9 / 5 },
					2 -> { 3 },
					0 -> { 1 }
				]
			) * (5 ^ (e / 3).floor)
		}
	} {
		((p + 1) / 2) ^ e
	}
};
1:200.collect { :n |
	n.factorInteger.collect { :f |
		let [p, e] = f;
		f(p, e)
	}.product
}.scatterPlot
~~~

![](sw/spl/Help/Image/caseOf-A.svg)

* * *

See also: =, if, value, which

Guides: Control Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Switch.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Object.html#-switch)

Categories: Casing
