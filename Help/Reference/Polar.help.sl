# Polar

- _Polar(ρ, φ)_

Answer a `Complex` number with polar co-ordinates _(ρ,φ)_.

```
>>> Polar(1, 2)
-0.416147J0.909297

>>> Polar(3, -2)
-1.24844J-2.72789
```

Threads over lists:

```
>>> Polar(1, 0:6.pi / 4)
[
	 1.0000J0.0000
	 0.7071J0.7071
	 0.0000J1.0000
	-0.7071J0.7071
	-1.0000J0.0000
	-0.7071J-0.7071
	 0.0000J-1.0000
]
```

* * *

See also: Complex

Guides: Complex Number Functions

References:
_J_
[1](https://www.jsoftware.com/help/dictionary/drdot.htm)
