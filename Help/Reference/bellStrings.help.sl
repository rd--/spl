# bellStrings

- _bellStrings(n)_

Answer the Bell strings of length _n_.
The solution sequence is a Gray code.

Strings for _n=2_:

```
>>> bellStrings(2)
[
	0 0;
	1 0
]

>>> bellNumber(2)
2
```

Strings for _n=3_:

```
>>> bellStrings(3)
[
	0 0 0;
	1 0 0;
	1 1 0;
	2 1 0;
	0 1 0
]

>>> bellNumber(3)
5
```

Strings for _n=4_:

```
>>> bellStrings(4)
[
	0 0 0 0;
	1 0 0 0;
	1 1 0 0;
	2 1 0 0;
	0 1 0 0;
	0 1 1 0;
	2 1 1 0;
	1 1 1 0;
	1 2 1 0;
	3 2 1 0;
	2 2 1 0;
	0 2 1 0;
	0 0 1 0;
	2 0 1 0;
	1 0 1 0
]

>>> bellNumber(4)
15
```

Matrix plot of length five Bell strings:

~~~spl svg=A
(4 - bellStrings(5))
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/bellStrings-A.svg)

* * *

See also: bellNumber, catalanStrings

Guides: Combinatorial Functions

Further Reading: Yuan 2025
