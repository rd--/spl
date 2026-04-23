# isPureCollatzNumber

- _isPureCollatzNumber(n)_

Answer `true` if _n_ is a pure Collazt number, else `false`.

Pure Collatz numbers,
OEIS [A061641](https://oeis.org/A061641):

```
>>> 0:27.select(isPureCollatzNumber:/1)
[0 1 3 6 7 9 12 15 18 19 21 24 25 27]
```

Odd pure Collatz numbers,
OEIS [A187108](https://oeis.org/A187108):

```
>>> 0:27.select { :n |
>>> 	n.isOdd & {
>>> 		n.isPureCollatzNumber
>>> 	}
>>> }
[1 3 7 9 15 19 21 25 27]
```

Half of the first differences of the odd pure Collatz numbers,
OEIS [A193865](https://oeis.org/A193865):

```
>>> 0:75.select { :n |
>>> 	n.isOdd & {
>>> 		n.isPureCollatzNumber
>>> 	}
>>> }.differences / 2
[1 2 1 3 2 1 2 1 3 2 1 2 1 3 2 1 3 3 2 1]
```

Half of the first differences of the odd pure Collatz numbers,
OEIS [A193865](https://oeis.org/A193865):

~~~spl svg=A oeis=A193865
let a = 0:250.select { :n |
	n.isOdd & {
		n.isPureCollatzNumber
	}
};
(a.differences / 2).stepPlot
~~~

![](Help/Image/isPureCollatzNumber-A.svg)

* * *

See also: collatzSequence, collatzTerrasTree
