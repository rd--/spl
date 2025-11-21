# tribonacciNumber

- _tribonacciNumber(n)_

Answer the _n_-th tribonacci number,
calculated using a closed form.

First few terms:

```
>>> [0 .. 21].tribonacciNumber
[
	0 0 1 1 2
	4 7 13 24 44
	81 149 274 504 927
	1705 3136 5768 10609 19513
	35890 66012
]
```

The tribonacci numbers are given by a linear recurrence,
OEIS [A000073](https://oeis.org/A000073):

```
>>> linearRecurrence([1 1 1], [0 0 1], 22)
[
	0 0 1 1 2
	4 7 13 24 44
	81 149 274 504 927
	1705 3136 5768 10609 19513
	35890 66012
]
```

The same linear recurrence,
with differing initial values,
gives the following sequences,
OEIS
[A000213](https://oeis.org/A000213),
[A001590](https://oeis.org/A001590),
[A001644](https://oeis.org/A001644) &
[A100683](https://oeis.org/A100683):

```
>>> [1 1 1; 0 1 0; 3 1 3; -1 2 2]
>>> .collect { :i |
>>> 	linearRecurrence([1 1 1], i, 12)
>>> }
[
	1 1 1 3 5 9 17 31 57 105 193 355;
	0 1 0 1 2 3 6 11 20 37 68 125;
	3 1 3 7 11 21 39 71 131 241 443 815;
	-1 2 2 3 7 12 22 41 75 138 254 467
]
```

* * *

See also: fibonacci, tribonacciConstant, tribonacciWord

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TribonacciNumber.html),
_OEIS_
[1](https://oeis.org/A000073)
[2](https://oeis.org/A000213)
[3](https://oeis.org/A001590)
[4](https://oeis.org/A001644)
[5](https://oeis.org/A100683),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.tribonacci),
_W_
[1](https://en.wikipedia.org/wiki/Generalizations_of_Fibonacci_numbers)
