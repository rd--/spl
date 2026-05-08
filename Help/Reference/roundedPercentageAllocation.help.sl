# roundedPercentageAllocation

- _roundedPercentageAllocation(t, [x₁ x₂ …], d)_

Answer a list of numbers that sum to _t_ and are multiples of _d_ and are in proportion to _x_.

Split 100 into proportions of 1/3 and 2/3 to the nearest integer:

```
>>> 100.roundedPercentageAllocation([1 2] / 3, 1)
[33 67]
```

Split 100 into proportions of 1/3 and 2/3 to the nearest 1/100:

```
>>> 100.roundedPercentageAllocation([1 2] / 3, 1 / 100)
[33.33 66.67]
```

```
>>> let p = Sfc32(7382914).randomReal([0 1], 10);
>>> let a = 100.roundedPercentageAllocation(p, 1);
>>> let b = 100.roundedPercentageAllocation(p, 0.01);
>>> (a, b)
(
	[16 7 15 2 17 7 5 11 12 8],
	[15.70 6.65 14.51 2.33 17.95 7.24 4.59 10.65 11.94 8.44]
)
```

* * *

See also: round, sum

Guides: Rounding Functions

References:
_Mathematica_
[1](https://resources.wolframcloud.com/FunctionRepository/resources/RoundedPercentageAllocation/)
