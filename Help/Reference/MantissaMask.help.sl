# MantissaMask

- _MantissaMask(in, bits)_

Mask off bits in the mantissa of the floating point sample value.
This introduces a quantization noise,
but is less severe than linearly quantizing the signal.

Preserve only three bits of the mantissa:

```
MantissaMask(
	SinOsc(SinOsc(0.2, 0) * 400 + 500, 0) * 0.2,
	3
)
```

Preserve seven bits of the mantissa.
This makes the lower sixteen bits of the floating point number become zero.

```
MantissaMask(
	SinOsc(SinOsc(0.2, 0) * 400 + 500, 0) * 0.4,
	7
)
```

* * *

See also: Distort, RoundTo, SoftClip

Categories: Ugen
