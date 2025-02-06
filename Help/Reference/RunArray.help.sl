# RunArray

- _RunArray(runSequence, valueSequence)_

A run array provides space-efficient storage of data which tends to be constant over long runs of the possible indices.
Repeated values are stored singly and associated with a "run" length denoting the number of consecutive occurrences of the value.

Construct a `RunArray` from runs and values:

```
>>> RunArray([1, 3, 5], ['a', 'b', 'c'])
>>> .asList
>>> .stringJoin
'abbbccccc'
```

The method `runs` answers an array of how many elements are in each run,
and the method `values` answer an array of what the value is over those elements.

The `RunArray` implementation caches the last access so that streaming through `RunArray`s is not an _n_-squared process.

Many complexities of access can be bypassed by using the method `withStartStopAndValueDo`.

* * *

See also: asRunArray, List

Categories: Collection, Type
