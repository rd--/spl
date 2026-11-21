# lsUnfold

- _lsUnfold(f/1, x)_

Answer a stream that is first _x_,
and applies _f_ to the previous value to derive each next value.

```
>>> lsUnfold(
>>> 	{ :each |
>>> 		each + 1
>>> 	},
>>> 	1
>>> ).take(9).upToEnd
[1 .. 9]
```

* * *

See also: lsCollect, lsSelect

Guides: Patterns and Streams

Categories: Stream
