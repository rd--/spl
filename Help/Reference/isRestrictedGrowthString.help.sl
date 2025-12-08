# isRestrictedGrowthString

- _isRestrictedGrowthString([i₁ i₂ …])_

Answer `true` if the integer sequence _i_ is a restricted growth string.

```
>>> [1 1 2 2 1 3 3 2]
>>> .isRestrictedGrowthString
true

>>> [1 1 2 1 3 2 2 4]
>>> .isRestrictedGrowthString
true

>>> [1 1 2 1 4 3 2 2]
>>> .isRestrictedGrowthString
false
```

The restricted growth strings of the fifteen possible partitions of the set with four elements:

```
>>> [
>>> 	1 1 1 1;
>>> 	1 1 1 2;
>>> 	1 1 2 1;
>>> 	1 1 2 2;
>>> 	1 1 2 3;
>>> 	1 2 1 1;
>>> 	1 2 1 2;
>>> 	1 2 1 3;
>>> 	1 2 2 1;
>>> 	1 2 2 2;
>>> 	1 2 2 3;
>>> 	1 2 3 1;
>>> 	1 2 3 2;
>>> 	1 2 3 3;
>>> 	1 2 3 4
>>> ].allSatisfy(
>>> 	isRestrictedGrowthString:/1
>>> )
true

>>> 4.bellNumber
15
```

The string _2121_ is not a restricted growth string:

```
>>> [2 1 2 1].isRestrictedGrowthString
false
```

The string _1233_ is a restricted growth string,
the associated set partition is _1-2-34_:

```
>>> [1 2 3 3]
>>> .isRestrictedGrowthString
true

>>> [1 2 3 3].setPartition
[1; 2; 3 4]
```

The string _1232_ is a restricted growth string,
the associated set partition is _1-24-3_:

```
>>> [1 2 3 2]
>>> .isRestrictedGrowthString
true

>>> [1 2 3 2].setPartition
[1; 2 4; 3]
```

Enumerate and then test all _n_ letter restricted growth strings:

```
>>> let n = 6;
>>> let s = n.restrictedGrowthStrings;
>>> (
>>> 	s.size,
>>> 	s.allSatisfy(
>>> 		isRestrictedGrowthString:/1
>>> 	)
>>> )
(n.bellNumber, true)
```

* * *

See also: restrictedGrowthStrings, setPartitions

Guides: Combinatorial Functions

References:
_Mathematica_
[1](http://mathworld.wolfram.com/RestrictedGrowthString.html)

Futher Reading: Hutchinson 1963
