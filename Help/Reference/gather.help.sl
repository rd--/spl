# gather

- _gather(l, f:/2)_

Gather the elements of the list _l_ into sublists of identical elements,
according to _f_.

Gather elements into sublists of equal elements:

```
>>> ['a' 'b' 'a' 'd' 'b'].gather(=)
['a' 'a'; 'b' 'b'; 'd']
```

Gather elements that have equal first parts:

```
>>> ['a' 1; 'b' 1; 'a' 2; 'd' 1; 'b' 3]
>>> .gather { :i :j |
>>> 	i[1] = j[1]
>>> }
['a' 1; 'a' 2:;'b' 1; 'b' 3:; 'd' 1]
```

Gather elements that have equal integer parts:

```
>>> [0, 1/3 .. 3].gather { :i :j |
>>> 	i.floor = j.floor
>>> }
[0 1/3 2/3; 1/1 4/3 5/3; 2/1 7/3 8/3; 3/1]
```

Gather integers that have identical remainders:

```
>>> [1 .. 10].gather { :i :j |
>>> 	(i % 3) = (j % 3)
>>> }
[1 4 7 10; 2 5 8; 3 6 9]
```

* * *

See also: binLists, collect, counts, deleteDuplicates, groupBy, partition, select, split, sort, tally

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Gather.html)

Categories: Enumerating
