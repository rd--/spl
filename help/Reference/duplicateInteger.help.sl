# duplicateInteger

- _duplicateInteger(anObject, anInteger)_

Evaluate _value(anObject)_ _anInteger_ times and collect the results into a `List`.

```
>>> { 1 }.duplicateInteger(3)
[1 1 1]

>>> 1.duplicateInteger(3)
[1 1 1]
```

Make copies of collections:

```
>>> [1 2 3].duplicateInteger(3)
[1 2 3; 1 2 3; 1 2 3]
```

* * *

See also: #, duplicateShape, replicateInteger, List, value

Categories: Copying
