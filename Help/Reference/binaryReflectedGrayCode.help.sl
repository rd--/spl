# binaryReflectedGrayCode

- _binaryReflectedGrayCode(n)_

The binary reflected gray code of three places:

```
>>> 3.binaryReflectedGrayCode
[
	0 0 0;
	0 0 1;
	0 1 1;
	0 1 0;
	1 1 0;
	1 1 1;
	1 0 1;
	1 0 0
]

>>> 2 ^ 3
8
```

The binary reflected gray code of four places:

```
>>> 4.binaryReflectedGrayCode
[
	0 0 0 0;
	0 0 0 1;
	0 0 1 1;
	0 0 1 0;
	0 1 1 0;
	0 1 1 1;
	0 1 0 1;
	0 1 0 0;
	1 1 0 0;
	1 1 0 1;
	1 1 1 1;
	1 1 1 0;
	1 0 1 0;
	1 0 1 1;
	1 0 0 1;
	1 0 0 0
]

>>> 2 ^ 3
8
```

Step plot of bits of four letter code:

~~~spl svg=A
4.binaryReflectedGrayCode
.catenate
.stepPlot
~~~

![](sw/spl/Help/Image/binaryReflectedGrayCode-A.svg)

Step plot of prfix sum of bits of four letter code:

~~~spl svg=B
4.binaryReflectedGrayCode
.catenate
.prefixSum
.stepPlot
~~~

![](sw/spl/Help/Image/binaryReflectedGrayCode-B.svg)

* * *

See also: grayEncode

Guides: Combinatorial Functions
