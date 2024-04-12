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
>>> a.permute(p).join
'zbcdefghijklmnopqrstuvwxya'
```

Permute several characters:

```
>>> let a = 'english'.alphabet;
>>> let p = [1 6 18 2; 3 20 11].asPermutation;
>>> a.permute(p).join
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

>>> [1 5 3; 4 2 8].permutationReplace([3 4 5 8 1 6 7 2 9 10])
[1 .. 10]
```

Another way of inverting the action of `permute` is using `findPermutation`:

In[1]:=	expr = head[c, a, b, d, e, f]	https://wolfram.com/xid/0j42iaqm-fju6xa
Out[1]=	
In[2]:=	newexpr = Permute[expr, Cycles[{{1, 4, 3, 2}}]]	https://wolfram.com/xid/0j42iaqm-vdrow6
Out[2]=	
When all parts of the expression are different, the permutation can be uniquely recovered:

In[3]:=	FindPermutation[expr, newexpr]	https://wolfram.com/xid/0j42iaqm-3r5bh0
Out[3]=	
Permute is a right action with respect to the product of permutations:

In[1]:=	expr = F[a, b, c, d, e];
perm1 = Cycles[{{1, 4, 3}, {2, 5}}];
perm2 = Cycles[{{1, 5, 3, 2, 4}}];	https://wolfram.com/xid/0j42iaqm-35x781
In[2]:=	Permute[Permute[expr, perm1], perm2] === 
 Permute[expr, PermutationProduct[perm1, perm2]]	https://wolfram.com/xid/0j42iaqm-qgrhd7
Out[2]=	
Dimensions[Transpose[array,perm]] is equivalent to Permute[Dimensions[array],perm]:

In[1]:=	array = Array[a, {2, 3, 4, 5}];	https://wolfram.com/xid/0j42iaqm-3uz9h6
In[2]:=	perm = {3, 1, 4, 2};	https://wolfram.com/xid/0j42iaqm-jhy3k1
In[3]:=	Dimensions[Transpose[array, perm]]	https://wolfram.com/xid/0j42iaqm-lgxuu9
Out[3]=	
In[4]:=	Permute[Dimensions[array], perm]	https://wolfram.com/xid/0j42iaqm-pd6vp5
Out[4]=	
Compute the same results with the Cycles form of the permutation:

In[5]:=	cperm = PermutationCycles[perm]	https://wolfram.com/xid/0j42iaqm-7pj3b5
Out[5]=	
In[6]:=	Dimensions[Transpose[array, cperm]]	https://wolfram.com/xid/0j42iaqm-ey1z76
Out[6]=	
In[7]:=	Permute[Dimensions[array], perm]	https://wolfram.com/xid/0j42iaqm-wvj3n7
Out[7]=	
Applying Permute to a vector is equivalent to multiplying the vector from the right with a permutation matrix:

In[1]:=	v = {C[1], C[2], C[3], C[4], C[5]};
perm = Cycles[{{1, 4, 3}, {2, 5}}];	https://wolfram.com/xid/0j42iaqm-gj6nd
In[2]:=	Permute[v, perm] === v . PermutationMatrix[perm]	https://wolfram.com/xid/0j42iaqm-hgasgm
Out[2]=	
Possible Issues  (1)
Permute and Part interpret permutation lists in different ways:

In[1]:=	perm = {3, 1, 2};	https://wolfram.com/xid/0j42iaqm-4bzt7a
Permute places the first object at the third position, the second object at the first position and the third object at the second position:

In[2]:=	Permute[{a, b, c}, perm]	https://wolfram.com/xid/0j42iaqm-o4v57i
Out[2]=	
Part places the third object at the first position, the first object at the second position and the second object at the third position:

In[3]:=	Part[{a, b, c}, perm]	https://wolfram.com/xid/0j42iaqm-3zv174
Out[3]=	
Those interpretations are effectively the inverse of each other:

In[4]:=	Permute[{a, b, c}, InversePermutation[perm]]	https://wolfram.com/xid/0j42iaqm-opyee6
Out[4]=	
In[5]:=	Part[{a, b, c}, InversePermutation[perm]]	https://wolfram.com/xid/0j42iaqm-ry2rm0
Out[5]=	
See Also
Cycles FindPermutation Part PermutationGroup PermutationMatrix

Tech Notes
Permutations
Permutation Lists
Permutation Groups
Named Groups
Related Guides
Permutations
History
