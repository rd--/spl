# isPythagorean

- _isPythagorean(aFraction | aTuning)_

Answer `true` if the operand has prime limit of three.

The following tuning is Pythagorean:

```
>>> [486 512 576 648 729 768 864]
>>> .asRatioTuning
>>> .isPythagorean
true
```

since each of its ratios is Pythagorean:

```
>>> [
>>> 	1/1 256/243 32/27 4/3
>>> 	3/2 128/81 16/9
>>> ]
>>> .allSatisfy(isPythagorean:/1)
true
```

* * *

See also: primeLimit, RatioTuning

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Pythagorean_tuning)

Categories: Testing, Tuning
