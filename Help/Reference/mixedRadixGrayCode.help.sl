# mixedRadixGrayCode

- _mixedRadixGrayCode([b₁ b₂ …])_

Answer a mixed radix gray code given the list of bases _b_.

Mixed radix gray code of three places:

```
>>> [2 3 4].mixedRadixGrayCode
[
	0 0 0;
	1 0 0;
	1 2 0;
	0 2 0;
	0 1 0;
	1 1 0;
	1 1 3;
	0 1 3;
	0 2 3;
	1 2 3;
	1 0 3;
	0 0 3;
	0 0 2;
	1 0 2;
	1 2 2;
	0 2 2;
	0 1 2;
	1 1 2;
	1 1 1;
	0 1 1;
	0 2 1;
	1 2 1;
	1 0 1;
	0 0 1
]

>>> [2 3 4].product
24

>>> [2 3 4].mixedRadixGrayCode
>>> .isCyclicGrayCode
true
```

Matrix plot of _2,3,4_ mixed radix Gray code:

~~~spl svg=A
[2 3 4].mixedRadixGrayCode
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/mixedRadixGrayCode-A.svg)

Matrix plot of _5,3,2_ mixed radix Gray code:

~~~spl svg=B
[5 3 2].mixedRadixGrayCode
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/mixedRadixGrayCode-B.svg)

* * *

See also: bellStrings, catalanStrings

Guides: Combinatorial Functions

Further Reading: Yuan 2025
