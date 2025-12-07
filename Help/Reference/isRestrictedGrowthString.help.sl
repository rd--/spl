# isRestrictedGrowthString

- _isRestrictedGrowthString([i₁ i₂ …])_

Answer `true` if the integer sequence _i_ is a restricted growth string.

The restricted growth strings of the fifteen possible partitions of the set with four elements:

```
>>> [
>>> 	0 0 0 0;
>>> 	0 0 0 1;
>>> 	0 0 1 0;
>>> 	0 0 1 1;
>>> 	0 0 1 2;
>>> 	0 1 0 0;
>>> 	0 1 0 1;
>>> 	0 1 0 2;
>>> 	0 1 1 0;
>>> 	0 1 1 1;
>>> 	0 1 1 2;
>>> 	0 1 2 0;
>>> 	0 1 2 1;
>>> 	0 1 2 2;
>>> 	0 1 2 3
>>> ].allSatisfy(
>>> 	isRestrictedGrowthString:/1
>>> )
true

>>> 4.bellNumber
15
```

The string _1010_ is not a restricted growth string:

```
>>> [1 0 1 0].isRestrictedGrowthString
false
```

The string _0122_ is a restricted growth string,
the associated set partition is _1-2-34_:

```
>>> [0 1 2 2].isRestrictedGrowthString
true

>>> [0 1 2 2].setPartition
[1; 2; 3 4]
```

The string _0121_ is a restricted growth string,
the associated set partition is _1-24-3_:

```
>>> [0 1 2 1].isRestrictedGrowthString
true

>>> [0 1 2 1].setPartition
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
