# lsUnfold

- _lsUnfold(aBlock/1, start)_
- _lsUnfold(α, β, γ)_ ⟹ _lsUnfold(α, β).take(γ)_

Answer a stream that is first _start_, and applies _aBlock_ to the previous value to derive each next value.

```
>>> lsUnfold(
>>> 	{ :each |
>>> 		each + 1
>>> 	},
>>> 	1,
>>> 	9
>>> ).upToEnd
[1 .. 9]
```

* * *

See also: lsCollect, lsSelect

Guides: Patterns and Streams

Categories: Stream
