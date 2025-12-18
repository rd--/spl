# liftplanMatrix

- _liftplanMatrix(m₁, m₂)_
- _liftplanMatrix(m, i)_
- _liftplanMatrix(w)_

Answer the _liftplan_ weaving matrix given
_m₁_ is the _tieup_ matrix  (_Tu_) and
_m₂_ is the _treadling_ matrix (_Tr_).

The treadling matrix may be specified as an integer sequence.

The matrices may also be given by a `WeavingInformationFile`,
either directly in the file,
or as calculated from the tieup and treadling matrices.

A liftplan matrix given a tieup matrix and a treadling sequence:

```
>>> let m = [
>>> 	1 1 0 0;
>>> 	1 0 1 0;
>>> 	0 1 0 1;
>>> 	1 0 0 0
>>> ];
>>> let i = [1 2 3 4];
>>> m.liftplanMatrix(i)
[
	1 1 0 0;
	1 0 1 0;
	0 1 0 1;
	1 0 0 0
]
```

Plot a liftplan from a weaving information file:

~~~spl svg=A
'rd--'.gitHubFileUrl(
	'hsc3-data',
	'main',
	'data/weaving/booker/straight.wif'
).fetchText.then { :w |
	WeavingInformationFile(w)
	.liftplanMatrix
	.matrixPlot
}
~~~

![](sw/spl/Help/Image/liftplanMatrix-A.svg)

* * *

See also: drawdownMatrix, tieupMatrix, threadingMatrix, WeavingInformationFile

Guides: Matrix Functions
