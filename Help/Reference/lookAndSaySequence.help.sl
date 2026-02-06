# lookAndSaySequence

- _lookAndSaySequence(n, k)_

Answer the first _n_ terms of the look and say sequence of type _k_.
The answers are given as lists of digits.

The _A_ sequence begins with one and each following term describes the previous term:

```
>>> 10.lookAndSaySequence('A')
[
	1;
	1 1;
	2 1;
	1 2 1 1;
	1 1 1 2 2 1;
	3 1 2 2 1 1;
	1 3 1 1 2 2 2 1;
	1 1 1 3 2 1 3 2 1 1;
	3 1 1 3 1 2 1 1 1 3 1 2 2 1;
	1 3 2 1 1 3 1 1 1 2 3 1 1 3 1 1 2 2 1 1
]
```

The digit counts of the first few terms of _k='A'_,
OEIS [A005341](https://oeis.org/A005341):

```
>>> 23.lookAndSaySequence('A')
>>> .collect(size:/1)
[
	  1   2   2   4   6
	  6   8  10  14  20
	 26  34  46  62  78
	102 134 176 226 302
	408 528 678
]
```

Convert terms of _k='A'_ to to large integers,
OEIS [A005150](https://oeis.org/A005150):

```
>>> 11.lookAndSaySequence('A')
>>> .collect { :x |
>>> 	x.fromDigits(10L)
>>> }
[
	1L
	11L
	21L
	1211L
	111221L
	312211L
	13112221L
	1113213211L
	31131211131221L
	13211311123113112211L
	11131221133112132113212221L
]
```

The sequence _k='LS'_ describes the first _n_ integers starting at zero:

```
>>> 16.lookAndSaySequence('LS')
[
	1 0;
	1 1;
	1 2;
	1 3;
	1 4;
	1 5;
	1 6;
	1 7;
	1 8;
	1 9;
	1 1 1 0;
	2 1;
	1 1 1 2;
	1 1 1 3;
	1 1 1 4;
	1 1 1 5
]
```

As integers,
OEIS [A045918](https://oeis.org/A045918):

```
>>> 16.lookAndSaySequence('LS')
>>> .collect(fromDigits:/1)
[
	10 11 12 13 14 15 16 17 18 19
	1110 21 1112 1113 1114 1115
]
```

Plot digits of _k='A'_ sequence:

~~~spl svg=A
11.lookAndSaySequence('A')
.catenate
.stepPlot
~~~

![](sw/spl/Help/Image/lookAndSaySequence-A.svg)

Plot digits of _k='LS'_ sequence:

~~~spl svg=B
50.lookAndSaySequence('LS')
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/lookAndSaySequence-B.svg)

* * *

See also: conwaysConstant, gijswijtsSequence, lookAndSay

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LookandSaySequence.html),
_OEIS_
[1](https://oeis.org/A005150)
[2](https://oeis.org/A005341),
_W_
[1](https://en.wikipedia.org/wiki/Look-and-say_sequence)
