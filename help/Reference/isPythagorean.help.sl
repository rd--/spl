# isPythagorean

- _isPythagorean(aFraction | aTuning)_

Answer `true` if the operand has prime limit of three.

The following tuning is Pythagorean:

```
>>> let t = [486 512 576 648 729 768 864].asJiTuning;
>>> t.isPythagorean
true
```

since each of its ratios is Pythagorean:

```
>>> [1/1 256/243 32/27 4/3 3/2 128/81 16/9].allSatisfy(isPythagorean:/1)
true
```

* * *

See also: limit, primeLimit, RatioTuning

Categories: Testing, Tuning
