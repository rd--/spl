# randomByteArray

- _randomByteArray(aRandomNumberGenerator, anInteger)_

Answer a ByteArray of _anInteger_ places, each randomly initialized.

```
>>> let r = Sfc32(37941);
>>> let b = r.randomByteArray(16);
>>> (b.isByteArray, b.size, b.asHexString.size, b)
(	true,
	16,
	32,
	[
		121 133 92  73   6 148 101 35
		 32 203 65 217 247 250  62 42
	].asByteArray
)
```

* * *

See also: randomInteger, randomLargeInteger, randomReal

Categories: Random
