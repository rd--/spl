# meshGrid

- _meshGrid(x, y)_

Answer grid coordinates,
with x-coordinates defined by the vector _x_,
and y-coordinates defined by the vector _y_.

```
>>> let [x, y] = 1:3.meshGrid(1:5);
>>> (x, y, (x ^ 2) + (y ^ 2))
(
	[
		1 2 3;
		1 2 3;
		1 2 3;
		1 2 3;
		1 2 3
	],
	[
		1 1 1;
		2 2 2;
		3 3 3;
		4 4 4;
		5 5 5
	],
	[
		2 5 10;
		5 8 13;
		10 13 18;
		17 20 25;
		26 29 34
	]
)
```

* * *

See also: surfacePlot

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/meshgrid.html)
