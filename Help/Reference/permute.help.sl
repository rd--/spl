# permute

- _permute([x₁ x₂ …], p)_

Answers the reordering of the sequence _x_ according to the permutation _p_.

Cyclic permutation of three elements in a list:

```
>>> let p = Permutation[[1 3 2]];
>>> [1 .. 5].permute(p)
[2 3 1 4 5]
```

Equivalent action with a permutation list:

```
>>> let p = Permutation[3 1 2];
>>> [1 .. 5].permute(p)
[2 3 1 4 5]
```

The two Mongean shuffles of twelve:

```
>>> let p = Permutation[
>>> 	1 7 10 2 6 4 5 9 11 12; 3 8
>>> ];
>>> [1 .. 12].permute(p)
[12 10 8 6 4 2 1 3 5 7 9 11]

>>> let p = Permutation[
>>> 	1 6 9 2 7 3 5 4 8 10 11; 12
>>> ];
>>> [1 .. 12].permute(p)
[11 9 7 5 3 1 2 4 6 8 10 12]
```

Exchange the first and last characters of the english alphabet:

```
>>> let a = 'english'.namedAlphabet;
>>> let p = Permutation[[1 26]];
>>> a.permute(p).stringJoin
'zbcdefghijklmnopqrstuvwxya'
```

Permute several characters:

```
>>> let a = 'english'.namedAlphabet;
>>> let c = [1 6 18 2; 3 20 11];
>>> let p = Permutation(c);
>>> a.permute(p).stringJoin
'brkdeaghijtlmnopqfscuvwxyz'
```

The permutation may be given as a `List`,
either of cycles:

```
>>> [1 .. 5].permute([1 3; 2 4])
[3 4 1 2 5]
```

or a list:

```
>>> [1 .. 5].permute([3 4 1 2])
[3 4 1 2 5]
```

When applied to the identity permutation list, `permute` is the inverse of `permutationReplace`:

```
>>> [1 .. 10].permute([1 5 3; 4 2 8])
[3 4 5 8 1 6 7 2 9 10]

>>> [3 4 5 8 1 6 7 2 9 10]
>>> .permutationReplace([1 5 3; 4 2 8])
[1 .. 10]
```

Another way of inverting the action of `permute` is using `findPermutation`:

```
>>> let a = [3 1 2 4 5 6];
>>> let p = [1 4 3 2; 5; 6].cycles;
>>> let b = a.permute(p);
>>> a.findPermutation(b)
p
```

Applying `permute` to a vector is equivalent to multiplying the vector from the right with a permutation matrix:

```
>>> let l = [1 2 3 4 5];
>>> let p = [1 4 3; 2 5].cycles;
>>> let m = p.matrix;
>>> (l.permute(p), l.dot(m))
(
	[3 5 4 1 2],
	[3 5 4 1 2]
)
```

Plain Bob Minimus,
columns are
OEIS [https://oeis.org/A090277](https://oeis.org/https://oeis.org/A090277),
OEIS [https://oeis.org/A090278](https://oeis.org/https://oeis.org/A090278),
OEIS [https://oeis.org/A090279](https://oeis.org/https://oeis.org/A090279),
and
OEIS [https://oeis.org/A090280](https://oeis.org/https://oeis.org/A090280):

```
>>> let i = [1; 2; 3; 4];
>>> let p = [1 2; 3 4];
>>> let q = [1; 2 3; 4];
>>> let r = [1; 2; 3 4];
>>> let c = [p q p q p q p r];
>>> let a = [1 2 3 4];
>>> ([i] ++ c.repeat(3)).collect { :x |
>>> 	a := a.permute(x)
>>> }
[
	1 2 3 4;
	2 1 4 3;
	2 4 1 3;
	4 2 3 1;
	4 3 2 1;
	3 4 1 2;
	3 1 4 2;
	1 3 2 4;
	1 3 4 2;
	3 1 2 4;
	3 2 1 4;
	2 3 4 1;
	2 4 3 1;
	4 2 1 3;
	4 1 2 3;
	1 4 3 2;
	1 4 2 3;
	4 1 3 2;
	4 3 1 2;
	3 4 2 1;
	3 2 4 1;
	2 3 1 4;
	2 1 3 4;
	1 2 4 3;
	1 2 3 4
]
```

A permutation sequence,
the rule is that the central pair changes order,
then the two middle pairs,
then the outer pairs,
the period is twenty:

~~~spl svg=A
let p = [
	3 4:;
	2 3; 4 5:;
	1 2; 5 6
];
let a = [1 2 3 4 5 6];
let b = [];
1:19.do { :i |
	b.add(a.copy);
	a := a.permute(p.atWrap(i))
};
b.transpose.matrixPlot
~~~

![](Help/Image/permute-A.svg)

* * *

See also: cycles, findPermutation, permutationMatrix, permutationReplace

Guides: Permutation Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Permute.html)

Categories: Permutations
