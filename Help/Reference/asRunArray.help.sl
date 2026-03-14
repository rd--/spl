# asRunArray

- _asRunArray([x₁ x₂ …])_

Convert the sequence _x_ into a `RunArray`:

```
>>> 'abbbccccc'.characters
>>> .asRunArray
RunArray([1 3 5], ['a' 'b' 'c'])
```

There is a distinct method to convert a sequence of _run -> value_ associations into a `RunArray`:

```
>>> [1 -> 'a', 3 -> 'b', 5 -> 'c']
>>> .associationListToRunArray
>>> .asList
>>> .stringJoin
'abbbccccc'
```

At empty list:

```
>>> [].asRunArray
RunArray([], [])
```

Run lengths of binary representation of _n_,
OEIS [A101211](https://oeis.org/A101211):

~~~spl svg=A oeis=A101211
1:21.collect { :n |
	let d = n.binaryExpansion;
	d.asRunArray.runs
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/asRunArray-A.svg)

Array of run lengths of binary representation of _n_,
OEIS [A227186](https://oeis.org/A227186):

~~~spl svg=B oeis=A227186
0:13.antidiagonalArray { :n :k |
	(n = 0).if {
		0
	} {
		let d = n.binaryExpansion;
		let a = d.reverse.asRunArray;
		let r = a.runs;
		let c = r.size;
		(k + 1 <= c).if {
			r[k + 1]
		} {
			0
		}
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/asRunArray-B.svg)

* * *

See also: RunArray

Guides: List Functions

Categories: Converting
