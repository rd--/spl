# ImageViewer

- _ImageViewer(smallKansas, title, aUrl)_

A image viewer.
Add a window to _smallKansas_ with the given _title_ displaying the image at _aUrl_.

Create an object `Url` of an `Svg` of a `LineDrawing`,
and display it:

~~~spl smallKansas
system.smallKansas.ImageViewer(
	'A Circle & Line',
	[
		Circle([0 0], 1),
		Line([0 0; 2 0])
	].LineDrawing.asObjectUrl
)
~~~

Fetch a Png file, and display by creating an object Url:

~~~spl ui
system
.splUrl('png/Emacs Editor.3.png')
.fetchBlob
.thenElse { :answer |
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

~~~spl smallKansas
system
.splUrl('svg/ScProgramBrowser.3.svg')
.fetchBlob
.thenElse { :answer |
	let url = answer.createObjectUrl;
	system
	.smallKansas
	.ImageViewer(
		'SuperCollider Program Browser',
		url
	).onClose { :unused |
		url
		.revokeObjectUrl
	}
} { :reason |
	reason.postLine
}
~~~

Using a remote Url may not work due to _Cross-Origin Resource Policy_:

~~~spl smallKansas
system.smallKansas.ImageViewer(
	'SuperCollider Program Browser',
	system.splUrl('svg/ScProgramBrowser.3.svg')
)
~~~

* * *

See also: PngViewer, SmallKansas, SvgViewer

Categories: Kansas
