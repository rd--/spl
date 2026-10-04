# bakTangWiesenfeldModel

- _bakTangWiesenfeldModel(m, [x y], f/2)_

Implement one step,
of the Bak–Tang–Wiesenfeld Model,
also called the Abelian sandpile model,
which ends when the model reaches a stable configuration.
_m_ is the model state matrix,
_x,y_ is the index of the initial cell to step,
_f_ is a block that monitors the cell index at each intermediate step.

Step a 5×5 matrix where the centre cell has an initial value of twenty-four,
count the number of intermediate steps before a stable configuration is arrived at:

```
>>> let p = [5 5].zeroes;
>>> p[3][3] := 24;
>>> let k = 0;
>>> p.bakTangWiesenfeldModel([3 3]) { :x :y |
>>> 	k := k + 1
>>> };
>>> (k, p)
(
	19,
	[
		0 0 1 0 0;
		0 2 3 2 0;
		1 3 0 3 1;
		0 2 3 2 0;
		0 0 1 0 0
	]
)
```

Step a 13×13 matrix where the centre cell has an initial value of _400_:

~~~spl svg=A
let p = [13 13].zeroes;
p[7][7] := 400;
p.bakTangWiesenfeldModel([7 7]);
p.colourMatrixPlot
~~~

![](Help/Image/bakTangWiesenfeldModel-A.svg)

* * *

See also: matrixNeighboursDo, vonNeumannNeighborhood

Guides: Matrix Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Abelian_sandpile_model)

Further Reading: Bak 1987
