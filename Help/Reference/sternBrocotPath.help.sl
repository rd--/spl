+Fraction{
	sternBrocotPath { :self |
		sternBrocotParent:/1.nestWhileList(self) { :x |
			x != 1/1
		}
	}
}

# sternBrocotPath

- _sternBrocotPath(n/d)_

Answer the path from the fraction _n/d_ to the root of the Stern-Brocot tree.

Trace using `nestWhileList`:

```
>>> 23/16.sternBrocotPath
[23/16 13/9 10/7 7/5 4/3 3/2 2/1 1/1]
```

To give the path _to_ the indicated fraction use `reverse`:

```
>>> 23/16.sternBrocotPath.reverse
[1/1 2/1 3/2 4/3 7/5 10/7 13/9 23/16]
```

The length of the path is equal to the `sternBrocotLevel`:

```
>>> 23/16.sternBrocotLevel
8

>>> 23/16.sternBrocotPath.size
8
```

* * *

See also: sternBrocotChildren, sternBrocotLevel, sternBrocotParent, sternBrocotTree
