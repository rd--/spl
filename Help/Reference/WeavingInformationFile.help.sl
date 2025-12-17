# WeavingInformationFile

- _WeavingInformationFile(s)_

A `Type` representing a weaving information file (_Wif)_ specified by the string _s_.

An Estonian linen pattern:

~~~spl png=A
'rd--'.gitHubFileUrl(
	'hsc3-data',
	'data/weaving/eatough/Estonia-A.wif'
).fetchText.then { :w |
	WeavingInformationFile(w)
	.drawdownMatrix
	.Bitmap
}
~~~

![](sw/spl/Help/Image/WeavingInformationFile-A.png)

Another Estonian linen pattern:

~~~spl png=B
'rd--'.gitLabFileUrl(
	'hsc3-data',
	'data/weaving/eatough/Estonia-B.wif'
).fetchText.then { :w |
	WeavingInformationFile(w)
	.drawdownMatrix
	.Bitmap
}
~~~

![](sw/spl/Help/Image/WeavingInformationFile-B.png)

A rosepath pattern:

~~~spl png=C
'rd--'.gitHubFileUrl(
	'hsc3-data',
	'data/weaving/eatough/Rosepath.wif'
).fetchText.then { :w |
	WeavingInformationFile(w)
	.drawdownMatrix
	.first(36)
	.Bitmap(4)
}
~~~

![](sw/spl/Help/Image/WeavingInformationFile-C.png)

Threading matrix of Estonian design:

~~~spl svg=D
'rd--'.gitHubFileUrl(
	'hsc3-data',
	'data/weaving/eatough/Estonia-A.wif'
).fetchText.then { :w |
	WeavingInformationFile(w)
	.threadingMatrix
	.matrixPlot
}
~~~

![](sw/spl/Help/Image/WeavingInformationFile-D.svg)

Treadling matrix of Estonian design:

~~~spl svg=E
'rd--'.gitHubFileUrl(
	'hsc3-data',
	'data/weaving/eatough/Estonia-A.wif'
).fetchText.then { :w |
	WeavingInformationFile(w)
	.treadlingMatrix
	.matrixPlot
}
~~~

![](sw/spl/Help/Image/WeavingInformationFile-E.svg)

Tieup matrix of Estonian design:

~~~spl svg=F
'rd--'.gitHubFileUrl(
	'hsc3-data',
	'data/weaving/eatough/Estonia-A.wif'
).fetchText.then { :w |
	WeavingInformationFile(w)
	.tieupMatrix
	.matrixPlot
}
~~~

![](sw/spl/Help/Image/WeavingInformationFile-F.svg)

A sample design that includes two patterns separated by an empty row:

~~~spl svg=G
'lealbaugh'.gitHubFileUrl(
	'little-loom',
	'wifs/plain.wif'
).fetchText.then { :w |
	WeavingInformationFile(w)
	.drawdownMatrix
	.matrixPlot
}
~~~

![](sw/spl/Help/Image/WeavingInformationFile-G.svg)

An initial fragment of a diamond design:

~~~spl png=H
'lealbaugh'.gitHubFileUrl(
	'little-loom',
	'wifs/diamonds.wif'
).fetchText.then { :w |
	WeavingInformationFile(w)
	.drawdownMatrix(256, 256)
	.Bitmap
}
~~~

![](sw/spl/Help/Image/WeavingInformationFile-H.png)

* * *

See also: drawdownMatrix

Guides: Matrix Functions

References:
_Maple Hill_
[1](http://www.tantradharma.com/maplehill/wif/wif1-1.txt)
