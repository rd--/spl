# map

- _map(f:/2)_
- _map(f:/1, c)_
- _map(f:/2, c₁, c₂)_
- _map(f:/3, c₁, c₂, c₃)_

The unary form answers a `Block` that will apply the block _f_ element wise to two sequences.
If the sequences are not of equal size the shorter will be recycled.
This form is equivalent to `each`.

```
>>> ['i' 'j' 'k'] ++.map ['w' 'x' 'y' 'z']
['iw' 'jx' 'ky' 'iz']

>>> ['i' 'j' 'k'].withCollect(
>>> 	['w' 'x' 'y' 'z'],
>>> 	++
>>> )
['iw' 'jx' 'ky' 'iz']

>>> ['i' 'j' 'k'] ++.each ['w' 'x' 'y' 'z']
['iw' 'jx' 'ky' 'iz']
```

The binary form is a variant of `collect`:

```
>>> { :x |
>>> 	x * x
>>> }.map([3 5 7])
[9 25 49]

>>> [3 5 7].collect { :x |
>>> 	x * x
>>> }
[9 25 49]
```

The ternary form is a variant of `withCollect`:

```
>>> { :p :q |
>>> 	p * 2 + q
>>> }.map(9:-1:1, 1:9)
[19 .. 11]

>>> 9:-1:1.withCollect(
>>> 	1:9
>>> ) { :p :q |
>>> 	p * 2 + q
>>> }
[19 .. 11]

>>> *.map([1 3 5], [3 5 7])
[3 15 35]

>>> [1 3 5].withCollect([3 5 7], *)
[3 15 35]
```

The quaternary form is a variant of `withWithCollect`:

```
>>> { :p :q :r |
>>> 	p * q ^ r
>>> }.map(1:7, 9:-1:3, 5:-1:-1)
[59049 65536 9261 576 25 1 0.04762]

>>> 1:7.withWithCollect(
>>> 	9:-1:3,
>>> 	5:-1:-1
>>> ) { :p :q :r |
>>> 	p * q ^ r
>>> }
[59049 65536 9261 576 25 1 0.04762]
```

Reverse all sublists:

```
>>> reverse:/1.map([1 2; 3 4; 5 6])
[2 1; 4 3; 6 5]
```

Add the same vector to every vector in a list:

```
>>> { :x | x + [4 5] }.map([1 2; 3 4; 5 6])
[5 7; 7 9; 9 11]
```

Negate integers that are prime:

```
>>> { :x |
>>> 	x.isPrime.if { x.- } { x }
>>> }.map(1:20)
[
	  1 -2   -3  4  -5   6   -7  8    9 10
	-11 12  -13 14  15  16  -17 18  -19 20
]
```

* * *

See also: array, collect, each, swap, table, withCollect, withWithCollect

Guides: Block Functions, List Functions

References:
_Python_
[1](https://docs.python.org/3/library/functions.html#map)

Categories: Enumerating
