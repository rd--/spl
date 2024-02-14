# withIndexCollect

- _withIndexCollect(aSequence, aBlock:/2)_

Like _withCollect_ except that the iteration index supplies the second argument to the block.

At Range:

```
>>> 9:1.withIndexCollect { :each :index | each * 2 + index }
[19 .. 11]

>>> 9:1.withCollect(1:9) { :each :index | each * 2 + index }
[19 .. 11]
```

At Record:

```
>>> (x: 1, y: 2, z: 3).withIndexCollect { :each :index | each -> index }
(x: 1 -> 'x', y: 2 -> 'y', z: 3 -> 'z')
```

* * *

See also: collect, withCollect

Categories: Enumerating
