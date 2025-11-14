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
