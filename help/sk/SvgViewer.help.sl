# SvgViewer -- image viewer

- _SvgViewer(aSmallKansas, aString, anSvg)_

Add a window displaying an Svg image.

The expression below fetches an Svg file from a Url and displays it when it arrives.

```
system.window.fetchString(
	'https://rohandrape.net/sw/stsc3/lib/svg/smalltalk-balloon.svg',
	 ()
 ).then { :answer |
	system.smallKansas.SvgViewer(
		'Smalltalk Balloon',
		answer.parseSvg
	)
}
```

The expression below generates and displays an Svg image:

```
var document = system.window.document;
var svg = document.createSvgElement(
	'svg',
	(
		height: '50',
		width: '50'
	)
);
var group = document.createSvgElement(
	'g',
	(
		transform: 'translate(25, 25) scale(1, -1)'
	)
);
var circle = document.createSvgElement(
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
var line = document.createSvgElement(
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
system.smallKansas.SvgViewer('Circle and Line', svg)
```
