# kolakoskiSequence

- _kolakoskiSequence(n)_

Answer the first _n_ terms of the Kolakoski sequence.

+SmallFloat{
	kolakoskiSequence { :n |
		let a = [1 2 2];
		[3 .. n].injectInto(a) { :i :j |
			i ++ List(i[j], mod(j, 2, 1))
		}.take(n)
	}
}

```
>>> 108.kolakoskiSequence
[
	1 2 2 1 1 2 1 2 2 1
	2 2 1 1 2 1 1 2 2 1
	2 1 1 2 1 2 2 1 1 2
	1 1 2 1 2 2 1 2 2 1
	1 2 1 2 2 1 2 1 1 2
	1 1 2 2 1 2 2 1 1 2
	1 2 2 1 2 2 1 1 2 1
	1 2 1 2 2 1 2 1 1 2
	2 1 2 2 1 1 2 1 2 2
	1 2 2 1 1 2 1 1 2 2
	1 2 1 1 2 1 2 2
]
```

Plot first few terms:

~~~spl svg=A
37.kolakoskiSequence
.discretePlot
~~~

![](sw/spl/Help/Image/kolakoskiSequence-A.svg)

References:
_Mathematica_
[1](https://mathworld.wolfram.com/KolakoskiSequence.html),
_W_
[1](https://en.wikipedia.org/wiki/Kolakoski_sequence)
