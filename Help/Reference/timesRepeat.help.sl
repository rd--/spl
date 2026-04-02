# timesRepeat

- _timesRepeat(n, f:/0)_

Evaluate the no-argument block _f_ the number of times represented by the integer _n_.

Iterate a program mutating a value:

```
>>> let n = 2;
>>> 3.timesRepeat {
>>> 	n := n * n
>>> };
>>> n
256

>>> square:/1.iterate(2, 3)
256
```

Generate a symbolic continued fraction:

```
>> let t = `x`;
>> 3.timesRepeat {
>> 	t := 1 / (1 + t)
>> };
>> t
(/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 x))))))

>>> { :x | 1 / (1 + x) }.iterate(4, 3)
1 / (
	1 + (
		1 / (
			1 + (
				1 / (1 + 4)
			)
		)
	)
)
```

Build a table of Mersenne exponents and Mersenne primes,
OEIS [A000043](https://oeis.org/A000043)
and
OEIS [A000668](https://oeis.org/A000668):

```
>>> let t = [];
>>> 1:23.do { :n |
>>> 	let m = 2 ^ n - 1;
>>> 	m.isPrime.ifTrue {
>>> 		t.add([n, m])
>>> 	}
>>> };
>>> t
[
	2 3;
	3 7;
	5 31;
	7 127;
	13 8191;
	17 131071;
	19 524287
]
```

Unlike `toDo`,
or `do` at a `Range`,
the block does not receive the iteration counter as a parameter.

* * *

See also: do, iterate, toDo

Categories: Enumerating
