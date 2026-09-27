# withIndexCollectInPlace

- _withIndexCollect!(c, f/2)_

Like `collectInPlace` except that the iteration index supplies the second argument to the block _f_.
Answers `c`.

```
>>> let l = [9, 8 .. 1];
>>> l.withIndexCollect! { :each :index |
>>> 	each * index
>>> };
>>> l
[9 16 21 24 25 24 21 16 9]
```

* * *

See also: do, collectInPlace, withIndexCollect, withIndexDo

Categories: Enumerating
