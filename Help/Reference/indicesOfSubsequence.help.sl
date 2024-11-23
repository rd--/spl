# indicesOfSubsequence

- _indicesOfSubsequence(aSequence, anotherSequence)_

Answer the indices for each place that _anotherSequence_ occurs as a subsequence in _aSequence_.

```
>>> let p = [1 2 3 4 5 4 3 2 1];
>>> [2 4; 2 3; 1 2 5].collect { :each |
>>> 	p.indicesOfSubsequence(each)
>>> }
[
	2 4; 2 6:;
	2 3; 2 7:;
	1 2 5
]
```

* * *

See also: indicesOfSubstring
