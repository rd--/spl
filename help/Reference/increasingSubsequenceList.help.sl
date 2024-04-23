# increasingSubsequenceList

- _increasingSubsequenceList(aSequence, aBlock:/2)_

Answer a `List` of the longest increasing subsequences of _aSequence_, according to the comparison _aBlock_.
In the unary case, the comparison operator is `<`.

There are two longest increasing subsequences of the permutation _326451_:

```
>>> let p = [3 2 6 4 5 1];
>>> let k = 3;
>>> p.increasingSubsequenceList.select { :each |
>>> 	each.size = k
>>> }
[3 4 5; 2 4 5]
```

* * *

See also: longestIncreasingSubsequence

