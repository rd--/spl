# ludicArray

- _ludicArray([m n])_

Anser the _m×n_ Ludic array,
where row _n_ lists the numbers removed at stage _n_ in the sieve which produces Ludic numbers.

Nine rows and six columns of the Ludic array:

```
>>> [9 6].ludicArray
[
	 2   4   6   8  10  12;
	 3   9  15  21  27  33;
	 5  19  35  49  65  79;
	 7  31  59  85 113 137;
	11  55 103 151 203 251;
	13  73 133 197 263 325;
	17 101 187 281 367 461;
	23 145 271 403 523 655;
	25 167 311 457 599 745;
	29 205 371 551 719 895
]
```

The Ludic array read by antidiagonals,
OEIS [A255127](https://oeis.org/A255127):

~~~spl svg=A oeis=A255127
OeisEntry('A255127').then { :e |
	e.data.discretePlot
}
~~~

![](Help/Image/ludicArray-A.svg)

* * *

See also: ludicNumbers

Guides: Matrix Functions

References:
_OEIS_
[1](https://oeis.org/A255127)
