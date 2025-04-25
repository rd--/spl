# connectLineSegments

- _connectLineSegments(l, f:/2)_

Connect the line segments at _l_,
end points are compared for equality using _f_.

The input is a list of edges,
represented as two element lists.
The answer is a list of paths.

Line segments in a one-dimensional space, compared using `=`:

```
>>> [1 2; 3 2; 4 5; 0 1; 6 5]
>>> .connectLineSegments(=)
[0 1 2 3; 4 5 6]
```

Line segments in a two-dimensional space, compared using `=`:

```
>>> [
>>> 	1 1; 2 2:;
>>> 	3 3; 2 2:;
>>> 	4 4; 5 5:;
>>> 	0 0; 1 1:;
>>> 	6 6; 5 5
>>> ].connectLineSegments(=)
[
	0 0; 1 1; 2 2; 3 3:;
	4 4; 5 5; 6 6
]
```

* * *

See also: LineSegment, Line, List

Guides: Geometry Functions
