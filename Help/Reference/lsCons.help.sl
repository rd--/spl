# lsCons

- _lsCons(anObject, aStream)_

Answer the stream that is first _anObject_ and thereafter _aStream_.

```
>>> lsCons(1, lsSeries(2, 1, 8)).upToEnd
[1 .. 9]
```

* * *

See also: lsCat

Categories: Stream
