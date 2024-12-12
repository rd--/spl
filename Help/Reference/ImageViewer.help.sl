# ImageViewer

- _ImageViewer(smallKansas, title, aUrl)_

A image viewer.
Add a window to _smallKansas_ with the given _title_ displaying the image at _aUrl_.

Create an object `Url` of an `Svg` of a `LineDrawing`,
and display it:

~~~
system.smallKansas.ImageViewer(
	'A Circle & Line',
	[
		Circle([0 0], 1),
		Line([0 0; 2 0])
	].LineDrawing.asObjectUrl
)
~~~

Fetch a Png file, and display by creating an object Url:

~~~
let url = [
	'https://rohandrape.net/'
	'sw/stsc3/lib/png/'
	'smalltalk-balloon.png'
].join('');
url.fetchBlob.thenElse { :answer |
	let url = answer.createObjectUrl;
	system.smallKansas.ImageViewer(
		'Smalltalk Balloon',
		url
	).onClose { :unused |
		url.revokeObjectUrl
	}
} { :reason |
	reason.postLine
}
~~~

Fetch an Svg file, and display by creating an object Url:

~~~
let url = [
	'https://rohandrape.net/'
	'sw/stsc3/lib/svg/'
	'smalltalk-balloon.svg'
].join('');
url.fetchBlob.thenElse { :answer |
	let url = answer.createObjectUrl;
	system.smallKansas.ImageViewer(
		'Smalltalk Balloon',
		url
	).onClose { :unused |
		url.revokeObjectUrl
	}
} { :reason |
	reason.postLine
}
~~~

Using a remote Url may not work due to _Cross-Origin Resource Policy_:

~~~
system.smallKansas.ImageViewer(
	'Smalltalk Balloon',
	[
		'https://rohandrape.net/'
		'sw/stsc3/lib/png/'
		'smalltalk-balloon.png'
	].join('')
)
~~~

* * *

See also: PngViewer, SmallKansas, SvgViewer

Categories: Kansas
