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
```

* * *

See also: restrictedGrowthStrings, setPartitions

Guides: Combinatorial Functions

References:
_Mathematica_
[1](http://mathworld.wolfram.com/RestrictedGrowthString.html)
