# isConstantStructure

- _isConstantStructure(aTuning)_

Answer `true` if _aTuning_ is a constant structure, else `false`.
A scale is said to have constant structure if its interval classes are distinct,
that is if each interval size that occurs in the scale always subtends the same number of steps.
This is the case if each interval in the `intervalMatrix` occurs in only one column.

A pentatonic scale that is a constant structure:

```
>>> let r = [1/1 9/8 5/4 3/2 5/3];
>>> let t = r.asRatioTuning;
>>> (
>>> 	t.isConstantStructure,
>>> 	t.intervalMatrix
>>> )
(
	true,
	[
		1/1  9/8  5/4  3/2   5/3;
		1/1 10/9  4/3 40/27 16/9;
		1/1  6/5  4/3  8/5   9/5;
		1/1 10/9  4/3  3/2   5/3;
		1/1  6/5 27/20 3/2   9/5
	]
)
```

A pentatonic scale that is not a constant structure,
the intervals _5/3, 5/4, 6/5, 8/5_ each occur in two columns:

```
>>> let r = [1/1 25/24 6/5 3/2 5/3]
>>> let t = r.asRatioTuning;
>>> (
>>> 	t.isConstantStructure,
>>> 	t.intervalMatrix
>>> )
(
	false,
	[
		1/1  25/24   6/5   3/2   5/3;
		1/1 144/125 36/25  8/5  48/25;
		1/1   5/4   25/18  5/3 125/72;
		1/1  10/9    4/3  25/18  8/5;
		1/1   6/5    5/4  36/25  9/5
	]
)
```

A twelve note constant structure scale,
16 harmonics on _1/1_ and 16 subharmonics on _15/8_:

```
>>> [
>>> 	1/1 15/14 9/8 15/13 5/4 15/11
>>> 	11/8 3/2 13/8 5/3 7/4 15/8
>>> ]
>>> .asRatioTuning
>>> .isConstantStructure
true
```

* * *

See also: intervalMatrix, Tuning

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Constant_structure)

Categories: Testing, Tuning
