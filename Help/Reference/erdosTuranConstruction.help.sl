# erdosTuranConstruction

- _erdosTuranConstruction(n)_

Implement the Erdős–Turán construction to answer a Golomb ruler for the odd prime _n_.

A Golomb ruler of order five:

```
>>> erdosTuranConstruction(5)
[0 11 24 34 41]
```

Order seven:

```
>>> erdosTuranConstruction(7)
[0 15 32 44 58 74 85]
```

Calculate all differences for order five:

```
>>> let r = erdosTuranConstruction(5);
>>> let k = r.size;
>>> (1 .. k - 1).collect { :i |
>>> 	(i + 1 .. k).collect { :j |
>>> 		r[j] - r[i]
>>> 	}
>>> }
[
	11 24 34 41;
	13 23 30;
	10 17;
	7
]
```

* * *

See also: optimalGolombRulers

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GolombRuler.html),
_W_
[1](https://en.wikipedia.org/wiki/Golomb_ruler)
