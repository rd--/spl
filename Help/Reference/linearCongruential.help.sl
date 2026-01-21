# linearCongruential

- _linearCongruential([a c m], n, ⍴)_

Answer  an array of shape _⍴_ for the linear congruential generator sequence given parameters _a,c,m_ and initial term _n_.

The first five terms given parameters for the Knuth MMIX generator:

```
>>> let a = 6364136223846793005L;
>>> let c = 1442695040888963407L;
>>> let m = 2L ^ 64;
>>> [a c m].linearCongruential(1L, [5])
[
	                   1L
	 7806831264735756412L
	 9396908728118811419L
	11960119808228829710L
	 7062582979898595269L
]
```

* * *

See also: LinearCongruential, xorShift32

Guides: Integer Sequence Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Linear_congruential_generator)

Further Reading: Thomson 1958

Categories: Random
