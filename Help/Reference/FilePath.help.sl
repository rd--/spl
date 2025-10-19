# FilePath

- _FilePath(p)_

A `Type` holding a file system path.

```
>>> FilePath('/etc/fstab')
>>> .absolutePathString
'/etc/fstab'
```

Convert to a `Url`:

```
>>> FilePath('/etc/fstab')
>>> .asUrl
Url('file:///etc/fstab')
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
