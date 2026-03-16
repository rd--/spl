# FilePath

- _FilePath(p)_

A `Type` holding a file system path.

Access components using
`absolutePathString`,
`directory`,
`basename`,
`stem`,
`extension`:

```
>>> let p = FilePath('/etc/cron.d');
>>> [
>>> 	p.absolutePathString,
>>> 	p.directory,
>>> 	p.basename,
>>> 	p.stem,
>>> 	p.extension
>>> ]
[
	'/etc/cron.d'
	'/etc'
	'cron.d'
	'cron'
	'.d'
]
```

Convert to a `Url`:

```
>>> FilePath('/etc/fstab')
>>> .asUrl
Url('file:///etc/fstab')
```

Replace extension:

```
>>> FilePath('plus.help.sl')
>>> .replaceExtension('.sl', '.md')
FilePath('plus.help.md')
```

* * *

See also: Url

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/File.html),
_W_
[1](https://en.wikipedia.org/wiki/Filename)
[2](https://en.wikipedia.org/wiki/Path_(computing))
