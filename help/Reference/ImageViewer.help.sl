# ImageViewer

- _ImageViewer(smallKansas, title, url)_

A image viewer.
Add a window to _smallKansas_ with the given _title_ displaying the image at _url_.

Fetch a Png file, and display by creating an object Url:

~~~
let url = 'https://rohandrape.net/sw/stsc3/lib/png/smalltalk-balloon.png';
url.fetchBlob.then { :answer |
	let url = answer.createObjectUrl;
	system.smallKansas.ImageViewer(
		'Smalltalk Balloon',
	).onClose { :unused |
		url.revokeObjectUrl
	}
}
~~~

Fetch an Svg file, and display by creating an object Url:

~~~
let url = 'https://rohandrape.net/sw/stsc3/lib/svg/smalltalk-balloon.svg';
url.fetchBlob.then { :answer |
	let url = answer.createObjectUrl;
	system.smallKansas.ImageViewer(
		'Smalltalk Balloon',
		url
	).onClose { :unused |
		url.revokeObjectUrl
	}
}
~~~

Using a remote Url may not work due to _Cross-Origin Resource Policy_:

~~~
system.smallKansas.ImageViewer(
	'Smalltalk Balloon',
	'https://rohandrape.net/sw/stsc3/lib/png/smalltalk-balloon.png'
)
~~~

* * *

See also: PngViewer, SmallKansas, SvgViewer
