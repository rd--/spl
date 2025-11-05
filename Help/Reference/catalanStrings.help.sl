# catalanStrings

- _catalanStrings(n, k)_

Answer the _k_-Catalan strings of length _n_.
The solution sequence is a Gray code.

The length three two-Catalan strings:

```
>>> catalanStrings(3, 2)
[
	0 0 0;
	1 0 0;
	1 1 0;
	2 1 0;
	0 1 0
]

>>> fussCatalanNumber(2, 1, 3)
5
```

The length four two-Catalan strings:

```
>>> catalanStrings(4, 2)
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
	1 0 1 0
]

>>> fussCatalanNumber(2, 1, 4)
14
```

Matrix plot of length five two-Catalan strings:

~~~spl svg=A
(3 - catalanStrings(5, 2))
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/catalanStrings-A.svg)

* * *

See also: bellStrings, fussCatalanNumber

Guides: Combinatorial Functions

Further Reading: Yuan 2025
