# lfdClipNoise

- _lfdClipNoise(freq=500)_

Dynamic clipped noise.
Generate the values -1 or +1 at a rate given by the _freq_ argument.

- freq: Approximate rate at which to generate random values.

There are two differences to lfClipNoise:

- no time quantization
- fast recovery from low freq values

If you dont need very high or very low freqs, or use fixed freqs, lfClipNoise is more efficient.

Mouse control of frequency. lfClipNoise will get stuck:

```
lfClipNoise(mouseX(0.1, 1000, 1, 0.2)) * 0.1
```

lfdClipNoise will change smoothly:

```
lfdClipNoise(mouseX(0.1, 1000, 1, 0.2)) * 0.1
```

lfClipNoise is silent for two seconds before going up in frequency:

```
lfClipNoise(xLine(0.5, 10000, 3)) * 0.1
```

lfdClipNoise is more immediate:

```
lfdClipNoise(xLine(0.5, 10000, 3)) * 0.1
```

lfClipNoise quantizes time steps at high frequencies

```
lfClipNoise(xLine(1000, 20000, 10)) * 0.1
```

lfdClipNoise does not:

```
lfdClipNoise(xLine(1000, 20000, 10)) * 0.1
```

* * *

See also: lfClipNoise, lfNoise0, lfNoise1, lfNoise2, lfdNoise0, lfdNoise1, lfdNoise3

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LFDClipNoise.html)

Categories: Ugen
