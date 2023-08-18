# copy -- copying

- _copy(anObject)_

Answer another object just like the receiver.

	[1 .. 5].copy = [1 .. 5]
	| a = [1 .. 5]; | a ~~ a.copy
	| a = [1 .. 5], b = a.copy; | a[1] := 5; b[1] ~= 5

Copy is defined in terms of _shallowCopy_ and _postCopy_.

* * *

See also: copyFromTo, copyWith, copyWithout, deepCopy, postCopy, shallowCopy

