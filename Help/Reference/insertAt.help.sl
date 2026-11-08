# insertAt!

- _insertAt!(c, x, n)_

Inserts the object _x_ at integer index (position) _n_ in the sequential collection _c_ in-place,
so that afterwards it is accessible at the specified index.
It is possible to insert at the start of _c_,
at index `one`,
and at the end,
at index _#c+1_.
Answers _x_.

Insert at start:

```
>>> let a = [2 3 4];
>>> let b = a.insertAt!(1, 1);
>>> (a, b)
([1, 2, 3, 4], 1)
```

Insert at end:

```
>>> let a = [1 2 3];
>>> let b = a.insertAt!(4, 4);
>>> (a, b)
([1, 2, 3, 4], 4)
```

Insert three to be at position two:

```
>>> let x = 3;
>>> let n = 2;
>>> let a = [1];
>>> let b = a.insertAt!(x, n);
>>> let c = a.at(n);
>>> (x, n, a, b, c)
(3, 2, [1 3], 3, 3)
```

Insert _x_ to be at position three:

```
>>> let l = List'abcde';
>>> let r = l.insertAt!('x', 3);
>>> (r, l, l[3])
('x', ['a' 'b' 'x' 'c' 'd' 'e'], 'x')
```

Equivalent to `addBeforeIndex`:

```
>>> let l = [1 2 4 5 6];
>>> let r = l.addBeforeIndex!(3, 3);
>>> (r, l, l[3])
(3, [1 2 3 4 5 6], 3)
```

Front-to-back insertion-permutation sequence,
OEIS [A098280](https://oeis.org/A098280):

~~~spl svg=A
let f/1 = { :n |
	(n = 1).if {
		[[1]]
	} {
		f(n - 1).collect { :x |
			1:n.collect { :i |
				let y = x.copy;
				y.insertAt!(n, i);
				y
			}
		}.catenate
	}
}.memoize;
1:4.collect(f/1).catenate.catenate.scatterPlot
~~~

![](Help/Image/insertAt-A.svg)

* * *

See also: addAfter, addAfterIndex, addBeforeIndex, at, copyReplaceFromToWith, removeAt

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Insert.html)
