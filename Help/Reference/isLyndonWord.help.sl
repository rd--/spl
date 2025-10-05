# isLyndonWord

- _isLyndonWord([w₁ w₂ …])_

Answer `true` if the finite word _w_ is a Lyndon word.

A Lyndon word:

```
>>> [1 2 3 1 3 2 1 3 3]
>>> .isLyndonWord
true
```

A non-Lyndon word:

```
>>> [1 2 2 1 1 2]
>>> .isLyndonWord
false
```

The empty word is non-Lyndon:

```
>>> [].isLyndonWord
false
```

The unit word is Lyndon:

```
>>> [1].isLyndonWord
true
```

The words answered by `lyndonWords` are Lyndon words:

```
>>> [0 1].lyndonWords(5)
>>> .allSatisfy(isLyndonWord:/1)
true

* * *

See also: lyndonWords

Guides: Combinatorial Functions,Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LyndonWord.html),
_W_
[1](https://en.wikipedia.org/wiki/Lyndon_word)
