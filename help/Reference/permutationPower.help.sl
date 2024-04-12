# permutationPower

- _permutationPower(aPermutation, anInteger)_

Answer the _anInteger_-th permutation power of the _aPermutation_.
Effectively computes the product of _aPermutation_ with itself _anInteger_ times.

When _anInteger_ is negative, `permutationPower` finds powers of the inverse of _aPermutation_.

When _anInteger_ is zero, `permutationPower` answers the identity permutation.

Sixth power of a permutation:

```
>>> [4 2 5; 6 3 1 7].permutationPower(6)
[1 6; 3 7].cycles
```

Second power of the inverse permutation:

```
>>> [4 2 5; 6 3 1 7].permutationPower(-2)
[1 6; 2 5 4; 3 7].cycles
```

`permutationPower` can yield the identity permutation:

```
>>> [4 2 5; 6 3 1 7].permutationPower(12)
[].cycles
```

>>> [1 11 4; 2 18 10 14; 3 17 20 13 12 5 15; 6 8 7].permutationPower(150)

12 ^ 345

>>> [p p p p].permutationProduct
>>> In[1]:=	PermutationPower[Cycles[{{4, 2, 5}, {6, 3, 1, 7}}], 6]	https://wolfram.com/xid/0b0kvcg78ou-evspdf
Out[1]=	

In[1]:=	PermutationPower[Cycles[{{4, 2, 5}, {6, 3, 1, 7}}], -2]	https://wolfram.com/xid/0b0kvcg78ou-dlxl3
Out[1]=	
Out[1]=	
Scope  (1)
Compute arbitrary powers of a permutation:

In[1]:=	perm = Cycles[{{1, 11, 4}, {2, 18, 10, 14}, {3, 17, 20, 13, 12, 5, 15,
      19, 9, 16}, {6, 8, 7}}];	https://wolfram.com/xid/0b0kvcg78ou-ima6pi
In[2]:=	PermutationPower[perm, 12^345]	https://wolfram.com/xid/0b0kvcg78ou-kjj2qp
Out[2]=	
Generalizations & Extensions  (2)
PermutationPower does not evaluate for symbolic arguments:

In[1]:=	PermutationPower[h, 2]	https://wolfram.com/xid/0b0kvcg78ou-mqvr0z
Out[1]=	
In[2]:=	PermutationPower[Cycles[{{3, 4}, {7, 10, 20}}], x]	https://wolfram.com/xid/0b0kvcg78ou-f3hqhe
Out[2]=	
PermutationPower performs some simplifications for generic symbolic input:

In[1]:=	PermutationPower[PermutationPower[x, 2], 5]	https://wolfram.com/xid/0b0kvcg78ou-0hrh4p
Out[1]=	
In[2]:=	PermutationPower[PermutationProduct[a, b], 3]	https://wolfram.com/xid/0b0kvcg78ou-dnta4w
Out[2]=	
Properties & Relations  (1)
For exponents that are multiples of the order of the permutation, the permutation power yields identity:

In[1]:=	perm = Cycles[{{1, 11, 4}, {2, 18, 10, 14}, {3, 17, 20, 13, 12, 5, 
     15}, {6, 8, 7}}];	https://wolfram.com/xid/0b0kvcg78ou-nwcn1y
In[2]:=	PermutationPower[perm, PermutationOrder[perm]]	https://wolfram.com/xid/0b0kvcg78ou-wmxxlq
Out[2]=	
Hence large powers can be reduced by using the modulo of the exponent:

In[3]:=	PermutationPower[perm, 10^10] == 
 PermutationPower[perm, Mod[10^10, PermutationOrder[perm]]]	https://wolfram.com/xid/0b0kvcg78ou-ckrn90
Out[3]=	
See Also
Cycles PermutationProduct InversePermutation

Tech Notes
Permutations
Related Guides
Permutations
