# pngViewer -- image viewer

- _pngViewer(aSmallKansas, aString, aByteArray)_

Add a window displaying a Png image.

The expression below fetches an Png file from a Url and displays it when it arrives.

```
system.window.fetchBlob(
	'https://rohandrape.net/sw/stsc3/lib/png/smalltalk-balloon.png',
	 ()
 ).then { :answer |
	workspace::smallKansas.pngViewer(
		'Smalltalk Balloon',
		answer
	)
}
```
