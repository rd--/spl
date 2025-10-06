# deBruijnSequence

- _deBruijnSequence([x₁ x₂ …], n)_

Answer a de Bruijn sequence on the elements _x_ taken _n_ at a time.

A de Bruijn sequence of order two on the list _0,1_:

```
>>> [0 1].deBruijnSequence(2)
[0 0 1 1]

>>> 2 ^ 2
4
```

A de Bruijn sequence of order three:

```
>>> [0 1].deBruijnSequence(3)
[0 0 0 1 0 1 1 1]

>>> 2 ^ 3
8
```

A de Bruijn sequence on the elements _0,1,2,3_:

```
>>> [0 1 2 3].deBruijnSequence(2)
[0 0 1 0 2 0 3 1 1 2 1 3 2 2 3 3]

>>> 4 ^ 2
16
```

A de Bruijn sequence on a string:

```
>>> 'abcd'.deBruijnSequence(2)
'aabacadbbcbdccdd'

>>> 4 ^ 2
16
```

A de Bruijn sequence of order 1 on a list is the list itself:

```
>>> [1 2 3].deBruijnSequence(1)
[1 2 3]

>>> 3 ^ 1
3
```

The ordering of the input list determines the ordering of the de Bruijn sequence:

```
>>> [2 3 1; 3 1 2].collect { :each |
>>> 	each.deBruijnSequence(2)
>>> }
[
	2 2 3 2 1 3 3 1 1;
	3 3 1 3 2 1 1 2 2
]

>>> 3 ^ 2
9
```

The length of a de Bruijn sequence is _k ^ n_:

```
>>> let k = 4;
>>> let n = 3;
>>> [1 .. k].deBruijnSequence(n).size
(k ^ n)
```

The subsequences of length _n_ in a de Bruijn sequence form all possible _n_-tuples on the elements _1:k_:

```
>>> let k = 3;
>>> let n = 2;
>>> let d = [1 .. k].deBruijnSequence(n);
>>> let p = (d ++ [d.first]).partition(n, 1);
>>> let t = 1:k.tuples(n);
>>> (p, t, p.sorted(precedes:/2) = t)
(
	[
		1 1; 1 2; 2 1; 1 3; 3 2;
		2 2; 2 3; 3 3; 3 1
	],
	[
		1 1; 1 2; 1 3; 2 1; 2 2;
		2 3; 3 1; 3 2; 3 3
	],
	true
)
```

Construct a binary de Bruijn sequence of order four,
and show relation to `lyndonWords`:

```
>>> [0 1].deBruijnSequence(4)
[0 0 0 0 1 0 0 1 1 0 1 0 1 1 1 1]

>>> [0 1].lyndonWords(4).select { :x |
>>> 	4.divisible(x.size)
>>> }
[0; 0 0 0 1; 0 0 1 1; 0 1; 0 1 1 1; 1]
```

Use `shiftRegisterSequence` to generate a binary de Bruijn sequence:

```
>>> let i = [0 1 1 1];
>>> let t = [1 2];
>>> let n = 2 ^ 4 - 1;
>>> [0] ++ shiftRegisterSequence(i, t, n)
[0 1].deBruijnSequence(4)
```

* * *

See also: partition, shiftRegisterSequence, tuples

Guides: Combinatorial Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/deBruijnSequence.html)
[2](https://reference.wolfram.com/language/ref/DeBruijnSequence.html),
_W_
[1](https://en.wikipedia.org/wiki/De_Bruijn_sequence)

Categories: Math, Sequence
