# HelpIndex

- _HelpIndex([k₁ t₁; k₂ t₂; …])_

A `Type` holding an index of the Sᴘʟ help files.
Each entry in the index is a list _(kind,topic)_.

The `helpIndex` method at `System` answers a `HelpIndex`:

```
>>> system.helpIndex.typeName
'HelpIndex'
```

Count _Reference_ files:

```
>>> system.helpIndex
>>> .names('Reference')
>>> .size.round(25)
4175
```

Count _Guide_ files:

```
>>> system.helpIndex
>>> .names('Guide')
>>> .size.round(25)
300
```

Write _Help Index_ file:

~~~spl console
let i = system.helpIndex;
let n = 'Help/Guide/Help Index.help.sl';
let p = system.splFileName(n);
let g = i.names('Guide');
let r = i.names('Reference');
let fmt = { :x |
	'- `%`'.format([x])
};
let a = [
	'# Help Index'
	''
	'Guides (A-Z):'
	''
];
let b = g.collect(fmt/1);
let c = [
	''
	'Reference (A-Z):'
	''
];
let d = r.select { :x |
	x[1].isUpperCase
}.collect(fmt/1);
let e = [
	''
	'Reference (a-z):'
	''
];
let f = r.select { :x |
	x[1].isLowerCase
}.collect(fmt/1);
system.writeTextFile(
	p,
	[a b c d e f]
	.catenate
	.unlines
)
~~~

* * *

See also: HelpFile, helpIndex

Guides: Help Functions
