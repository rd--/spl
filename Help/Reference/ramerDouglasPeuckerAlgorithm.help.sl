# ramerDouglasPeuckerAlgorithm

- _ramerDouglasPeuckerAlgorithm(aMatrix, aNumber)_

Simplify the line segment at _aMatrix_ to a similar line with fewer points using the Ramer–Douglas–Peucker algorithm.

Plot two approximate `sin` functions,
the initial approximation has 100 places,
the simplified form has 20 places.

~~~spl svg=A
let x = (0 -- 4.pi).discretize(100);
let l = x.collect { :each |
	[each, each.sin * 4]
};
let d = l.ramerDouglasPeuckerAlgorithm(0.1);
[l.Line, d.Line].LineDrawing
~~~

![](sw/spl/Help/Image/ramerDouglasPeuckerAlgorithm-A.svg)

The same `sin` approximation simplified to six places:

~~~spl svg=B
let x = (0 -- 4.pi).discretize(100);
let l = x.collect { :each |
	[each, each.sin * 4]
};
let d = l.ramerDouglasPeuckerAlgorithm(0.5);
[l.Line, d.Line].LineDrawing
~~~

![](sw/spl/Help/Image/ramerDouglasPeuckerAlgorithm-B.svg)

* * *

See also: pointLineDistance

References:
_W_
[1](https://en.wikipedia.org/wiki/Ramer%E2%80%93Douglas%E2%80%93Peucker_algorithm)

Further Reading: Douglas and Peucker 1973, Ramer 1972
