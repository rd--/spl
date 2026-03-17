# helpFragment

- _helpFragment(h, k, v, i=⍬)_

Fetch the fragment at the unique anchor specified by the key _k_ and value _v_ from the help file for topic _h_.

```
>> 'circleInversion'.helpFragment(
>> 	'svg',
>> 	'E'
>> )
let a = Circle([-2 0], 1);
let b = 9.annularSteinerChain(
	[0 0],
	0.475
);
let c = b.circleInversion(a);
[a b c].LineDrawing
```

If _indices_ are specified the paragraphs at the relative locations are also given:

```
>>> 'abs'.helpFragment(
>>> 	'svg',
>>> 	'A',
>>> 	[-1 1]
>>> ).first
[
	'Plot over a subset of the reals:',
	'![](Help/Image/abs-A.svg)'
]
```

* * *

See also: DocumentationTest, readHelpFile

Guides: Help Functions
