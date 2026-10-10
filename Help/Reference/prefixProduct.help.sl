# prefixProduct

- _prefixProduct([x₁ x₂ …])_

Answer the prefix product of _x_.

Prefix product of natural numbers,
OEIS [A000142](https://oeis.org/A000142):

```
>>> [1 2 3 4 5 6].prefixProduct
[1 2 6 24 120 720]

>>> [1 2 3 4 5 6].scanLeft(*)
[1 2 6 24 120 720]
```

The right scan is called `suffixProduct`:

```
>>> [1 2 3 4 5 6].suffixProduct
[720 720 360 120 30 6]

>>> [1 2 3 4 5 6].scanRight(*)
[720 720 360 120 30 6]
```

Triangle of suffix products,
OEIS [A094587](https://oeis.org/A094587):

```
>>> 0:7.collect { :n |
>>> 	1:n.suffixProduct ++ [1]
>>> }
[
	1;
	1 1;
	2 2 1;
	6 6 3 1;
	24 24 12 4 1;
	120 120 60 20 5 1;
	720 720 360 120 30 6 1;
	5040 5040 2520 840 210 42 7 1
]
```

Triangle of suffix products,
OEIS [A213936](https://oeis.org/A213936):

```
>>> 1:7.collect { :n |
>>> 	2:n.suffixProduct ++ [1]
>>> }
[
	1;
	2 1;
	6 3 1;
	24 12 4 1;
	120 60 20 5 1;
	720 360 120 30 6 1;
	5040 2520 840 210 42 7 1
]
```

Triangle of suffix products,
OEIS [A173333](https://oeis.org/A173333):

```
>>> 1:7.collect { :n |
>>> 	2:n.suffixProduct ++ [1 1]
>>> }
[
	1 1;
	2 1 1;
	6 3 1 1;
	24 12 4 1 1;
	120 60 20 5 1 1;
	720 360 120 30 6 1 1;
	5040 2520 840 210 42 7 1 1
]
```

* * *

See also: prefixSum, scanLeft, suffixProduct

Guides: List Functions
