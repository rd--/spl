# moduloFibonacciSequence

- _moduloFibonacciSequence(n, m, [a b]=[0 1])_

Answer the first _n_ places of the generalised Fibonacci sequence begining _a,b_ modulo _m_.
The calculation is done modulo _m_, there are no intermediate large integers.

Sequence modulo four with varying _a,b_:

```
>>> 12.moduloFibonacciSequence(4, [0 1])
[
	0 1 1 2 3 1
	0 1 1 2 3 1
]

>>> 12.moduloFibonacciSequence(4, [2 3])
[
	2 3 1 0 1 1
	2 3 1 0 1 1
]

>>> 12.moduloFibonacciSequence(4, [0 3])
[
	0 3 3 2 1 3
	0 3 3 2 1 3
]
```

Consider _mF(5)_ as a sequence of four multiplications of a five vector:

```
>>> 20.moduloFibonacciSequence(5)
[
	0 1 1 2 3
	0 3 3 1 4
	0 4 4 3 2
	0 2 2 4 1
]

>>> { :x |
>>> 	x * 3 % 5
>>> }.nestList([0 1 1 2 3], 4)
[
	0 1 1 2 3;
	0 3 3 1 4;
	0 4 4 3 2;
	0 2 2 4 1;
	0 1 1 2 3
]
```

Consider _mF(55,[1,8])_ as both a sequence of four multiplications of a five vector,
and of five multiplications of a four vector:

```
>>> 20.moduloFibonacciSequence(55, [1 8])
[
	1 8 9 17 26
	43 14 2 16 18
	34 52 31 28 4
	32 36 13 49 7
]

>>> { :x |
>>> 	x * 43 % 55
>>> }.nestList([1 8 9 17 26], 4)
[
	1 8 9 17 26;
	43 14 2 16 18;
	34 52 31 28 4;
	32 36 13 49 7;
	1 8 9 17 26
]

>>> 20.moduloFibonacciSequence(55, [1 8])
[
	1 8 9 17
	26 43 14 2
	16 18 34 52
	31 28 4 32
	36 13 49 7
]

>>> { :x |
>>> 	x * 26 % 55
>>> }.nestList([1 8 9 17], 5)
[
	1 8 9 17;
	26 43 14 2;
	16 18 34 52;
	31 28 4 32;
	36 13 49 7;
	1 8 9 17
]
```

Partition _mF(84,[0,14])_ into two columns.
The second column is a palindrome,
the first contains two disguised palindromes:

```
>>> let x = 24.moduloFibonacciSequence(84, [0 14]);
>>> let [a, b] = x.partition(2).transpose;
>>> (a.rotateLeft, a.rotateLeft(3) ++ [28], b)
(
	[
		14 42 28 42 14
		0 70 42 56 42 70 0
	],
	[
		28 42 14 0 70 42
		56
		42 70 0 14 42 28
	],
	[
		14 28 70 14 56 70
		70 56 14 70 28 14
	]
)
```

* * *

See also: fibonacciSequence, mod, pisanoPeriod

Further Reading: Haek 2008
