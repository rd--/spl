# permutationOrderList

- _permutationOrderList(p)_

Answer the `List` of permutations of successive self products of the permutation _p_ until arriving at identity.

```
>>> let p = [1 6 2; 3 5; 4].cycles;
>>> (
>>> 	p.permutationOrder,
>>> 	p.permutationOrderList
>>> )
(
	[3 2 1].lcm,
	[
		[1 6 2; 3 5; 4].cycles,
		[1 2 6; 3; 4; 5].cycles,
		[1; 2; 3 5; 4; 6].cycles,
		[1 6 2; 3; 4; 5].cycles,
		[1 2 6; 3 5; 4].cycles,
		[].cycles
	]
)
```

Plot permutation of six places with three cycles,
one a fixed point,
and order six:

~~~spl svg=A
[1 6 2; 3 5; 4]
.permutationOrderList.collect(
	permutationList:/1
).matrixPlot
~~~

![](sw/spl/Help/Image/permutationOrderList-A.svg)

Plot permutation of thirteen places with four cycles,
one a fixed point,
and order eight:

~~~spl svg=B
[1 10; 2; 3 6 4 5 12 8 11 9; 7 13]
.permutationOrderList.collect(
	permutationList:/1
).matrixPlot
~~~

![](sw/spl/Help/Image/permutationOrderList-B.svg)

Plot permutation of seventeen places with only one cycle,
no fixed points,
and therefore of order seventeen:

~~~
[7 17 15 8 11 10 14 1 3 9 2 4 12 5 13 6 16]
.permutationOrderList.collect(
	permutationList:/1
).matrixPlot
~~~

![](sw/spl/Help/Image/permutationOrderList-C.svg)

* * *

See also: permutationOrder

Guides: Permutation Functions

Categories: Permutations
