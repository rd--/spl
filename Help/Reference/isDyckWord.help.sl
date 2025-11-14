# isDyckWord

- _isDyckWord(n)_
- _isDyckWord([x₁ x₂ …], [a b]=[1 0])_

Answer `true` if the sequence _x_ is a Dyck word on the letters _a,b_.

On the letters _1,-1_:

```
>>> [1 1 -1 1 -1 -1 1 -1]
>>> .isDyckWord([1 -1])
true
```

On the letters _1,0_:

```
>>> [
>>> 	1 0 1 1 1 1 0 1 0 0
>>> 	1 0 1 1 0 1 0 1 1 0
>>> 	0 0 0 0
>>> ].isDyckWord
true
```

The `dyckWords` method enumerates Dyck words:

```
>>> 3.dyckWords
>>> .allSatisfy(isDyckWord:/1)
true
```

At `Integer` considers binary representation with tokens _1,0_:

First few words,
OEIS [A080116](https://oeis.org/A080116):

```
>>> 0:56.collect(isDyckWord:/1).boole
[
	1 0 1 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0
	0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	0 0 1 0 1 0 0 0 0 0 1 0 1 0 0 0 1
]
```

List of integers where the binary representation is a Dyck word,
OEIS [A014486](https://oeis.org/A014486):

```
>>> 0:915.select(isDyckWord:/1)
[
	 0   2   10  12  42
	 44  50  52  56 170
	172 178 180 184 202
	204 210 212 216 226
	228 232 240 682 684
	690 692 696 714 716
	722 724 728 738 740
	744 752 810 812 818
	820 824 842 844 850
	852 856 866 868 872
	880 906 908 914
]
```

Dyck language interpreted as binary numbers in ascending order,
OEIS [A063171](https://oeis.org/A063171):

```
>>> 0:684.select(isDyckWord:/1)
>>> .integerDigits(2)
>>> .collect(fromDigits:/1)
[
	0
	10
	1010
	1100
	101010
	101100
	110010
	110100
	111000
	10101010
	10101100
	10110010
	10110100
	10111000
	11001010
	11001100
	11010010
	11010100
	11011000
	11100010
	11100100
	11101000
	11110000
	1010101010
	1010101100
]
```

There are large gaps:

```
>>> (992 .. 2730).select(isDyckWord:/1)
[992 2730]
```

Plot first few terms:

~~~spl svg=A
0:999.select(isDyckWord:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/isDyckWord-A.svg)

* * *

See also: DyckWord, dyckWords

Guides: Combinatorial Functions

References:
_OEIS_
[1](https://oeis.org/A080116)
[2](https://oeis.org/A014486)
[3](https://oeis.org/A063171)
