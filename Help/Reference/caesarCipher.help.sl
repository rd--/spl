# caesarCipher

- _caesarCipher(s, n)_

Encode the string _s_ using the Caesar cipher,
also called Caesar’s method,
with step _n_.

```
>>> 'The quick brown fox jumps over the'
>>> .caesarCipher(-3)
'Qeb nrfzh yoltk clu grjmp lsbo qeb'

>>> 'Qeb nrfzh yoltk clu grjmp lsbo qeb'
>>> .caesarCipher(3)
'The quick brown fox jumps over the'
```

Words that cipher to words:

```
>>> 'fusion'.caesarCipher(6)
'layout'

>>> 'nowhere'.caesarCipher(13)
'abjurer'
```

* * *

See also: mod, rotate

Guides: String Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CaesarsMethod.html),
_W_
[1](https://en.wikipedia.org/wiki/Caesar_cipher)
