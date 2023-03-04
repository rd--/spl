# SvgViewer -- image viewer

- _SvgViewer(aSmallKansas, aString, anSvg)_

Add a window displaying an Svg image.

The expression below fetches an Svg file from a Url and displays it when it arrives.

```
system.window.fetchString(
	'https://rohandrape.net/sw/stsc3/lib/svg/smalltalk-balloon.svg',
	 ()
 ).then { :answer |
	workspace::smallKansas.SvgViewer(
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
var circle = document.createSvgElement(
	'circle',
	(
		cx: '25',
		cy: '25',
		r: '20',
		stroke: '#5588ff',
		fill: '#ee6655',
		'stroke-width': '2'
	)
);
svg.appendChild(circle);
workspace::smallKansas.SvgViewer('Circle', svg)
```
