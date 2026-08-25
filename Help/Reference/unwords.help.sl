# unwords

- _unwords([s₁ s₂ …])_

Answer a `String` made by joining together the items of the sequence _s_ with separating spaces.

```
>>> ['Lorem' 'ipsum' 'dolor'].unwords
'Lorem ipsum dolor'

>>> ['Lorem' 'ipsum' '' 'sit'].unwords
'Lorem ipsum  sit'
```

Note that `unwords` is neither left nor right inverse of `words`:

```
>>> ' '.words.unwords
''

>>> 'a\nb'.words.unwords
'a b'
```

* * *

See also: stringIntercalate, unlines, words

Guides: String Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:unwords)

Categories: Converting
