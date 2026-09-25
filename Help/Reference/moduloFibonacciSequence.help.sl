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

Transposition matrix of _fM(5)_:

```
>>> let a = 20.moduloFibonacciSequence(5);
>>> let b = 5 - a % 5;
>>> b +.t a % 5
[
	0 1 1 2 3 0 3 3 1 4 0 4 4 3 2 0 2 2 4 1;
	4 0 0 1 2 4 2 2 0 3 4 3 3 2 1 4 1 1 3 0;
	4 0 0 1 2 4 2 2 0 3 4 3 3 2 1 4 1 1 3 0;
	3 4 4 0 1 3 1 1 4 2 3 2 2 1 0 3 0 0 2 4;
	2 3 3 4 0 2 0 0 3 1 2 1 1 0 4 2 4 4 1 3;
	0 1 1 2 3 0 3 3 1 4 0 4 4 3 2 0 2 2 4 1;
	2 3 3 4 0 2 0 0 3 1 2 1 1 0 4 2 4 4 1 3;
	2 3 3 4 0 2 0 0 3 1 2 1 1 0 4 2 4 4 1 3;
	4 0 0 1 2 4 2 2 0 3 4 3 3 2 1 4 1 1 3 0;
	1 2 2 3 4 1 4 4 2 0 1 0 0 4 3 1 3 3 0 2;
	0 1 1 2 3 0 3 3 1 4 0 4 4 3 2 0 2 2 4 1;
	1 2 2 3 4 1 4 4 2 0 1 0 0 4 3 1 3 3 0 2;
	1 2 2 3 4 1 4 4 2 0 1 0 0 4 3 1 3 3 0 2;
	2 3 3 4 0 2 0 0 3 1 2 1 1 0 4 2 4 4 1 3;
	3 4 4 0 1 3 1 1 4 2 3 2 2 1 0 3 0 0 2 4;
	0 1 1 2 3 0 3 3 1 4 0 4 4 3 2 0 2 2 4 1;
	3 4 4 0 1 3 1 1 4 2 3 2 2 1 0 3 0 0 2 4;
	3 4 4 0 1 3 1 1 4 2 3 2 2 1 0 3 0 0 2 4;
	1 2 2 3 4 1 4 4 2 0 1 0 0 4 3 1 3 3 0 2;
	4 0 0 1 2 4 2 2 0 3 4 3 3 2 1 4 1 1 3 0
]
```

Rotational matrix of _fM(8)_:

```
>>> let a = 12.moduloFibonacciSequence(8);
>>> 0:11.collect { :i |
>>> 	let b = a.rotateLeft(i);
>>> 	b - b[1] % 8
>>> }
[
	0 1 1 2 3 5 0 5 5 2 7 1;
	0 0 1 2 4 7 4 4 1 6 0 7;
	0 1 2 4 7 4 4 1 6 0 7 0;
	0 1 3 6 3 3 0 5 7 6 7 7;
	0 2 5 2 2 7 4 6 5 6 6 7;
	0 3 0 0 5 2 4 3 4 4 5 6;
	0 5 5 2 7 1 0 1 1 2 3 5;
	0 0 5 2 4 3 4 4 5 6 0 3;
	0 5 2 4 3 4 4 5 6 0 3 0;
	0 5 7 6 7 7 0 1 3 6 3 3;
	0 2 1 2 2 3 4 6 1 6 6 3;
	0 7 0 0 1 2 4 7 4 4 1 6
]
```

Transposition matrix of _fM(5)_:

~~~spl svg=A
let a = 20.moduloFibonacciSequence(5);
let b = 5 - a % 5;
(b +.t a % 5 + a[1]).matrixPlot
~~~

![](Help/Image/moduloFibonacciSequence-A.svg)

Krenek-type rotational matrix of _fM(8)_:

~~~spl svg=B
12.moduloFibonacciSequence(8)
.krenekRotationalArray(8)
.matrixPlot
~~~

![](Help/Image/moduloFibonacciSequence-B.svg)

Transposition matrix of _fM(22,[1,4])_:

~~~spl svg=C
let a = 15.moduloFibonacciSequence(
	22, [1 4]
);
let b = 22 - a % 22;
(b +.t a % 22 + a[1])
.matrixPlot
~~~

![](Help/Image/moduloFibonacciSequence-C.svg)

* * *

See also: fibonacciSequence, mod, pisanoPeriod

Guides: Integer Sequence Functions

Further Reading: Haek 2008, Wall 1960
