# splHelpFragment

- _splHelpFragment(topic, key, value)_

Fetch the fragment at anchor _key=value_ from the help file for _topic_.

```
>> splHelpFragment(
>> 	'circleInversion',
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

* * *

See also: readHelpFile

Guides: Help Functions
