# LsCons

- _LsCons(anObject, aStream)_

Answer the stream that is first _anObject_ and thereafter _aStream_.

```
>>> LsCons(1, LsSeries(2, 1, 8)).upToEnd
[1 .. 9]
```

* * *

See also: LsCat

Categories: Stream
