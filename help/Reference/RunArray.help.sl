# RunArray -- collection type

A run array provides space-efficient storage of data which tends to be constant over long runs of the possible indices.
Repeated values are stored singly and associated with a "run" length denoting the number of consecutive occurrences of the value.

- _RunArray(runSequence, valueSequence)_

Construct a RunArray from runs and values:

	RunArray([1, 3, 5], ['a', 'b', 'c']).asArray.join = 'abbbccccc'

- _asRunArray(anArraySequence)_

Convert a sequence of _run -> value_ associations into a RunArray:

	'abbbccccc'.asArray.asRunArray.runs = [1 3 5]

The method _runs_ answers an array of how many elements are in each run,
and the method _values_ answer an array of what the value is over those elements.

The RunArray implementation caches the last access so that streaming through RunArrays is not an n-squared process.

Many complexities of access can be bypassed by using the method _withStartStopAndValueDo_.

* * *

See also: Array
