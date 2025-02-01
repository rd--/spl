# SvgViewer

- _SvgViewer(aSmallKansas, aString, anSvg, where)_

Image viewer.

Add a window displaying an Svg image.

The expression below fetches an Svg file from a Url and displays it when it arrives.

~~~spl smallKansas
let url = [
	'https://rohandrape.net/'
	'sw/stsc3/lib/svg/'
	'smalltalk-balloon.svg'
].join('');
url.fetchText.then { :answer |
	system.smallKansas.SvgViewer(
		'Smalltalk Balloon',
		answer.parseSvg,
		nil
	)
}
~~~

The expression below generates and displays an Svg image:

~~~spl smallKansas
let document = system.window.document;
let svg = document.createSvgElement(
	'svg',
	(
		height: '50',
		width: '50'
	)
);
let group = document.createSvgElement(
	'g',
	(
		transform: 'translate(25, 25) scale(1, -1)'
	)
);
let circle = document.createSvgElement(
	'circle',
	(
		cx: '0',
		cy: '0',
		r: '20',
		stroke: '#5588ff',
		fill: '#ee6655',
		'stroke-width': '2'
	)
);
let line = document.createSvgElement(
	'line',
	(
		x1: '0',
		y1: '0',
		x2: '12',
		y2: '12',
		stroke: '#88ff55',
		'stroke-width': '2'
	)
);
group.appendChildren([
	circle,
	line
]);
svg.appendChild(group);
system.smallKansas.SvgViewer(
	'Circle and Line',
	svg,
	nil
)
~~~

* * *

See also: PngViewer, SmallKansas

Categories: Kansas
