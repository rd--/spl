# PngViewer -- image viewer

- _PngViewer(aSmallKansas, aString, aByteArray)_

Add a window displaying a Png image.

The expression below fetches a Png file from a Url and displays it when it arrives.

```
system.window.fetchBlob(
	'https://rohandrape.net/sw/stsc3/lib/png/smalltalk-balloon.png',
	 ()
 ).then { :answer |
	workspace::smallKansas.PngViewer(
		'Smalltalk Balloon',
		answer
	)
}
```
