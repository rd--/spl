# permute

- _permute(aSequence, aPermutation)_

Answers the reordering of _aSequence_ according to _aPermutation_.

Cyclic permutation of three elements in a list:

```
>>> let p = [[1 3 2]].asPermutation;
>>> 1:5.permute(p)
[2 3 1 4 5]
```

Equivalent action with a permutation list:

```
>>> let p = [3 1 2].asPermutation;
>>> 1:5.permute(p)
[2 3 1 4 5]
```

Exchange the first and last characters of the english alphabet:

```
>>> let a = 'english'.alphabet;
>>> let p = [[1 26]].asPermutation;
>>> a.permute(p).join('')
'zbcdefghijklmnopqrstuvwxya'
```

Permute several characters:

```
>>> let a = 'english'.alphabet;
>>> let p = [1 6 18 2; 3 20 11].asPermutation;
>>> a.permute(p).join('')
'brkdeaghijtlmnopqfscuvwxyz'
```

The permutation may be given as a `List`,
either of cycles:

```
>>> 1:5.permute([1 3; 2 4])
[3 4 1 2 5]
```

or a list:

```
>>> 1:5.permute([3 4 1 2])
[3 4 1 2 5]
```

When applied to the identity permutation list, `permute` is the inverse of `permutationReplace`:

```
>>> [1 .. 10].permute([1 5 3; 4 2 8])
[3 4 5 8 1 6 7 2 9 10]

>>> [3 4 5 8 1 6 7 2 9 10].permutationReplace([1 5 3; 4 2 8])
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

* * *

See also: cycles, findPermutation, permutationMatrix

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Permute.html)

Categories: Permutations
