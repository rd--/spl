# PngViewer

- _PngViewer(smallKansas, title, pngData)_

_Png_ image viewer.
Add a window to _smallKansas_ with the given _title_ displaying the _Png_ image encoded at _pngData_.

The expression below fetches a Png file from a Url and displays it when it arrives:

~~~
let url = 'https://rohandrape.net/sw/stsc3/lib/png/smalltalk-balloon.png';
url.fetchBlob.then { :answer |
	system.smallKansas.PngViewer(
		'Smalltalk Balloon',
		answer
	)
}
~~~

* * *

See also: SmallKansas, SvgViewer

References:
_W3c_
[1](https://www.w3.org/TR/2003/REC-PNG-20031110/)
