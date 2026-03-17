# helpFragmentPreprocessor

- _helpFragmentPreprocessor(s)_

Run the help fragment pre-processor on the string _s_.

```
>>> '<<<abs,svg,A'
>>> .helpFragmentPreprocessor
>>> .lines
[
	'Plot over a subset of the reals:'
	''
	'```'
	'(-3 -- 3).functionPlot(abs:/1)'
	'```'
	''
	'![](Help/Image/abs-A.svg)'
]
```

The method `helpFilePreprocessor` reads a help file specified by a topic,
with a '.help.pre' suffix,
and applies the help fragment pre-processor to write the answer,
to a file with the usual '.help.sl' suffix.

* * *

See also: helpFragment

Guides: Help Functions
