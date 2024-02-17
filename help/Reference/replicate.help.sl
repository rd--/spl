# replicate

- _replicate(anObject, anInteger | aSequence)_

Make a List having _anInteger_ copies of _anObject_:

```
>>> 'x'.replicate(3)
['x' 'x' 'x']
```

Make an Array having shape _aSequence_, each entry being _anObject_:

```
>>> 'x'.replicate([3 2])
['x' 'x'; 'x' 'x'; 'x' 'x']
```

* * *

See also: #, !, duplicate, replicateApplying, replicateEach, reshape, shape

Categories: Copying
