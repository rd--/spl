# reverse (reverse!)

- _reverse([x₁ x₂ …], n=1)_

There are in-place and copying forms of reverse.
The in-place form reverses _x_ in-place and answers _x_.
In the copying form,
the answer is a new value of the same `species` as _x_ in the reverse order.

In-place form, at `List`:

```
>>> let x = [1 3 5 7];
>>> let y = x.reverse!;
>>> (x, x == y)
([7 5 3 1], true)
```

Copying form, at `List`:

```
>>> [1 3 5 7].reverse
[7 5 3 1]
```

In-place form, at `Range`:

```
>>> let x = Range(9, 1, -2);
>>> let y = x.reverse!;
>>> (x, x == y)
(Range(1, 9, 2), true)
```

At `String`:

```
>>> 'abcde'.reverse
'edcba'

>>> 'Backwards text'.reverse
'txet sdrawkcaB'

>>> 'no word, no bond, row on.'.reverse
'.no wor ,dnob on ,drow on'
```

`reverse` is its own inverse:

```
>>> 'Backwards text'.reverse.reverse
'Backwards text'
```

Row-reverse matrix:

```
>>> [1 2 3].diagonalMatrix.reverse
[
	0 0 3;
	0 2 0;
	1 0 0
]
```

Column-reverse matrix:

```
>>> [1 2 3].diagonalMatrix.reverse(2)
[
	0 0 1;
	0 2 0;
	3 0 0
]

>>> [1 2 3].diagonalMatrix
>>> .collect(reverse/1)
[0 0 1; 0 2 0; 3 0 0]
```

Reverse is its own inverse:

```
>>> [1 2 3 4].reverse.reverse
[1 2 3 4]
```

At `Map`,
`reverse` swaps keys and values,
requiring that each value be both unique,
so that it can act as a key,
and also _immediate_:

```
>>> Map['x' -> 1, 'y' -> 2, 'z' -> 3].reverse
Map[1 -> 'x', 2 -> 'y', 3 -> 'z']
```

Iteratively join a string to its reverse:

```
>>> { :x |
>>> 	x ++ x.reverse
>>> }.nestList('.|', 4)
[
	'.|'
	'.||.'
	'.||..||.'
	'.||..||..||..||.'
	'.||..||..||..||..||..||..||..||.'
]
```

Self-inverse permutation given by reversing the order of all but the most significant bit in binary expansion of _n_,
OEIS [A059893](https://oeis.org/A059893):

~~~spl svg=A oeis=A059893 permutation
1:64.collect { :n |
	let d = n.integerDigits(2);
	let x = d.first;
	let y = d.allButFirst;
	([x] ++ y.reverse).fromDigits(2)
}.scatterPlot
~~~

![](Help/Image/reverse-A.svg)

Where supported `reverse` is displayed as ᴙ.

* * *

See also: reverseDo, reverseWithDo

Guides: InPlace Syntax, List Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Reverse),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:reverse),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/bardot),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Reverse.html)
[1](https://reference.wolfram.com/language/ref/StringReverse.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#reverse),
_Smalltalk_
5.7.8.26

Unicode: U+1D19 ᴙ Latin Letter Small Capital Reversed R

Categories: Copying, Rearranging
