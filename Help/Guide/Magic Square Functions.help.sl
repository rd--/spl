# Magic Square Functions

- `isMagicSquare`
- `magicHexagon`
- `magicSquare`
- `magicSquareSummary`

A 4×4×4 magic cube:

```
>>> let c = [
>>> 	32  5 52 41;
>>> 	03 42 31 54;
>>> 	61 24 33 12;
>>> 	34 59 14 23
>>> 	:;
>>> 	10 35 22 63;
>>> 	37 64  9 20;
>>> 	27  2 55 46;
>>> 	56 29 44  1
>>> 	:;
>>> 	49 28 45  8;
>>> 	30  7 50 43;
>>> 	36 57 16 21;
>>> 	15 38 19 58
>>> 	:;
>>> 	39 62 11 18;
>>> 	60 17 40 13;
>>> 	06 47 26 51;
>>> 	25  4 53 48
>>> ];
>>> let column = { :m :c |
>>> 	(1 .. m.size).collect { :r |
>>> 		m[r][c]
>>> 	}
>>> };
>>> let f = { :m |
>>> 	m.magicSquareSummary.values
>>> };
>>> let s = [
>>> 	34,
>>> 	130 # 4,
>>> 	130 # 4,
>>> 	130,
>>> 	130,
>>> 	4
>>> ];
>>> (
>>> 	c.collect(f:/1),
>>> 	1:4.collect { :i |
>>> 		c.collect { :m |
>>> 			m[i]
>>> 		}.f
>>> 	},
>>> 	1:4.collect { :i |
>>> 		c.collect { :m |
>>> 			column(m, i)
>>> 		}.f
>>> 	}
>>> )
([s s s s], [s s s s], [s s s s])
```

* * *

Guides: Integer Sequence Functions, Matrix Functions

Further Reading: Andrews 1908
