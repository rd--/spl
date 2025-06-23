# correspondancePlot

- _correspondancePlot([i₁ i₂ …; j₁ j₂ …])_

Answer a correspondance diagram between two index sequences,
_i_ and _j_

Correspondance between 11- and 13- vectors:

~~~spl svg=A
[
	1 1 1 2 3 4 5 5 6 7 8 9 10 11;
	1 2 3 4 5 6 7 8 9 10 11 12 12 13
].correspondancePlot
~~~

![](sw/spl/Help/Image/correspondancePlot-A.svg)

Use `warpingCorrespondence` to derive correspondance:

~~~spl svg=B
[0 0 1 1 0 0 -1 0 0 0 0]
.warpingCorrespondence(
	[0 0 0 1 1 0 0 0 0.5 0 0 0 0]
).correspondancePlot
~~~

![](sw/spl/Help/Image/correspondancePlot-B.svg)

With random index sequences:

~~~spl svg=C
Sfc32(267814)
.randomInteger([1 23], [2 43])
.correspondancePlot
~~~

![](sw/spl/Help/Image/correspondancePlot-C.svg)

Correspondance plot of phase shifted and amplitude scaled Hann tables:

~~~spl svg=D
let h = 23.hannWindowTable;
let z = 0 # 11;
warpingCorrespondence(
	z ++ h,
	(h * 1.1) ++ z
).correspondancePlot
~~~

![](sw/spl/Help/Image/correspondancePlot-D.svg)

* * *

See also: warpingCorrespondence, warpingPlot

Guides: Plotting Functions, Sequence Alignment Functions
