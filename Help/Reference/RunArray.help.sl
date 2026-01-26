# RunArray

- _RunArray([r₁ r₂ …], [v₁ v₂ …])_

Answer a run array given a list of runs, _r_, and a list of values _v_.
A run array is a `Type` that provides space-efficient storage of data which tends to be constant over long runs of the possible indices.
Repeated values are stored singly and associated with a "run" length denoting the number of consecutive occurrences of the value.

Construct a `RunArray` from runs and values:

```
>>> RunArray([1 3 5], ['a' 'b' 'c'])
>>> .asList
>>> .stringJoin
'abbbccccc'
```

The method `runs` answers an array of how many elements are in each run,
and the method `values` answer an array of what the value is over those elements.

```
>>> let a = RunArray([1 3 5], ['a' 'b' 'c']);
>>> (a.runs, a.values)
([1 3 5], ['a' 'b' 'c'])
```

As a list of associations:

```
>>> RunArray([1 3 5], ['a' 'b' 'c'])
>>> .asAssociationList
[1 -> 'a', 3 -> 'b', 5 -> 'c']
```

The `RunArray` implementation caches the last access so that streaming through `RunArray`s is not an _n_-squared process.

Many complexities of access can be bypassed by using the method `withStartStopAndValueDo`.

* * *

See also: asRunArray, List

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Run-LengthEncoding.html),
_W_
[1](https://en.wikipedia.org/wiki/Run-length_encoding)

Categories: Collection, Type
