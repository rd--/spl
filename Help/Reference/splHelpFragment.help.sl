# splHelpFragment

- _splHelpFragment(topic, anchor)_

Fetch the fragment at _anchor_ from the help file for _topic_.

```
>> let [p, c] = splHelpFragment(
>> 	'circleInversion',
>> 	'svg=E'
>> );
>> c
let a = Circle([-2 0], 1);
let b = 9.annularSteinerChain(
	[0 0],
	0.475
);
let c = b.circleInversion(a);
[a b c].LineDrawing
```

* * *

See also: readHelpFile

Guides: Help Functions
