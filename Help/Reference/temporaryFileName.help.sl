# temporaryFileName

- _temporaryFileName(aSystem, prefix, suffix)_

Create an empty temporary file in an appropriate directory,
given a file name prefix and suffix,
and answer the file path.

```
>>> let x = system.temporaryFileName(
>>> 	'soundFile',
>>> 	'.wav'
>>> );
>>> (
>>> 	x.isString,
>>> 	x.includesSubstring('soundFile'),
>>> 	x.endsWith('.wav')
>>> )
(true, true, true)
```

* * *

See also: System

Guides: File Functions

Categories: Files, System
