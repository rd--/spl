# bellStrings

- _bellStrings(n)_

Answer the Bell strings of length _n_.
The solution sequence is a Gray code.

Strings for _n=2_:

```
>>> 2.bellStrings
[
	0 0;
	1 0
]

>>> 2.bellNumber
2
```

Strings for _n=3_:

```
>>> 3.bellStrings
[
	0 0 0;
	1 0 0;
	1 1 0;
	2 1 0;
	0 1 0
]

>>> 3.bellNumber
5
```

Strings for _n=4_:

```
>>> 4.bellStrings
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

>>> 4.bellNumber
15
```

Circular matrix plot of length five Bell strings,
the last column is elided since it is always zero:

~~~spl svg=A
5.bellStrings
.collect(allButLast:/1)
.circularMatrixPlot
~~~

![](Help/Image/bellStrings-A.svg)

* * *

See also: bellNumber, catalanStrings

Guides: Combinatorial Functions

Further Reading: Yuan 2025
