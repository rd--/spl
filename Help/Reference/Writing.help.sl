# Writing

- _Writing(aString, coordinates)_

`Writing` is a `Type` holding a `String` with associated coordinates.

Writing can be part of a line drawing:

~~~spl svg=A
let c = Circle([0 0], 100);
let w = Writing('Writing', [0, 0]);
let r = w.boundingBox.asRectangle;
[c, w, r].LineDrawing
~~~

![](sw/spl/Help/Image/Writing-A.svg)

Letters randomly placed in a circle:

~~~spl svg=B
let r = Sfc32(6793);
let c = Circle([0 0], 100);
let l = 'greek'.alphabet.contents;
let w = l.collect { :each |
	Writing(
		each,
		r.randomInteger(-70, 70, [2])
	)
};
[c, w].LineDrawing
~~~

![](sw/spl/Help/Image/Writing-B.svg)

* * *

See also: Record, String
