# duplicateInteger

- _duplicateInteger(anObject, anInteger)_

Evaluate _value(anObject)_ _anInteger_ times and collect the results into a `List`.

Three ones (_anObject_ is a `Block` that answers an integer):

```
>>> { 1 }.duplicateInteger(3)
[1 1 1]
```

Three ones (_anObject_ is an integer):

```
>>> 1.duplicateInteger(3)
[1 1 1]
```

Make three copies of a three element sequence:

```
>>> [1 2 3].duplicateInteger(3)
[1 2 3; 1 2 3; 1 2 3]
```

* * *

See also: #, duplicateShape, replicateInteger, List, value

Categories: Copying
