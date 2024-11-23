# withIndexReplace

- _withIndexReplace(aCollection, elementAndIndexBlock:/2)_

Like _replace_ except that the iteration index supplies the second argument to the block.

```
>>> let l = [9 .. 1];
>>> l.withIndexReplace { :each :index | each * index };
>>> l
[9 16 21 24 25 24 21 16 9]
```

* * *

See also: do, replace, withIndexCollect, withIndexDo

Categories: Enumerating
