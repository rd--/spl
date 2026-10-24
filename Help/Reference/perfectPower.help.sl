# perfectPower

- _perfectPower(n)_

If _n_ is a perfect power,
answer the base and exponent,
else answer `nil`.

The fourth power of seven:

```
>>> 2401.perfectPower
[7 4]

>>> 7 ^ 4
2401
```

Numbers which are perfect squares but not perfect cubes,
OEIS [A179126](https://oeis.org/A179126):

```
>>> 1:144.select { :n |
>>> 	perfectPower(n).ifNil {
>>> 		false
>>> 	} { :r |
>>> 		let [m, k] = r;
>>> 		k % 2 = 0 & { k % 6 != 0 }
>>> 	}
>>> }
[4 9 16 25 36 49 81 100 121 144]
```

Noncube perfect powers,
OEIS [A340585](https://oeis.org/A340585):

```
>>> 1:144.select { :n |
>>> 	perfectPower(n).ifNil {
>>> 		false
>>> 	} { :r |
>>> 		r[2] % 3 != 0
>>> 	}
>>> }
[4 9 16 25 32 36 49 81 100 121 128 144]
```

* * *

See also: isPerfectPower, power

Guides: Integer Functions
