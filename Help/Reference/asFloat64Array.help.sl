# asFloat64Array

- _asFloat64Array(aSequence)_

Encodings of small integers:

```
>>> [1 3 5 7 9].asFloat64Array.encode(true)
[
	  0   0   0   0   0   0 240  63
	  0   0   0   0   0   0   8  64
	  0   0   0   0   0   0  20  64
	  0   0   0   0   0   0  28  64
	  0   0   0   0   0   0  34  64
].asByteArray
```

* * *

See also: asFloat32Array, encode, Float64Array
