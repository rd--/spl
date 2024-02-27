# fill

- _fill(anInteger | aSequence, aBlock:/1)_

Allocate a `List` or array of the indicated shape and fill each slot by applying _aBlock_ to the index.

At `Integer`:

```
>>> 9.fill { :index | index * index }
[1 4 9 16 25 36 49 64 81]

>>> 9.fill(squared:/1)
[1 4 9 16 25 36 49 64 81]

>>> 5.fill(negated:/1)
[-1 -2 -3 -4 -5]
```

At `Sequence`:

```
>>> [3 2].fill { :i | i * i }
[1 1; 1 4:; 4 1; 4 4:; 9 1; 9 4]

>>> [3 3].fill { :index | let [i, j] = index; j - i }
[0 1 2; -1 0 1; -2 -1 0]
```

* * *

See also: !, atAllPut, fillFromWith
