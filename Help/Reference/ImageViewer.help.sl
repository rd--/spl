# ImageViewer

- _ImageViewer(k, t, u)_

A image viewer.
Add a window to the `SmallKansas` _k_ with the given title _t_ displaying the image at `Url` _u_.

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

Fetch a Png file, and display it by creating an object Url:

~~~spl ui
system
.splUrl('png/Emacs Editor.3.png')
.fetchBinaryLargeObject
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
.fetchBinaryLargeObject
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
