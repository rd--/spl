# findBinaryDoIfNone

- _findBinaryDoIfNone(aSequence, aBlock:/1, actionBlock:/1, exceptionBlock:/2)_

Search for an element in the _aSequence_ using binary search.
The argument _aBlock_ is a one-element block returning

- 0: if the element is the one searched for
- <0: if the search should continue in the first half
- >0: if the search should continue in the second half

If found, evaluate _actionBlock_ with the found element as argument.
If no matching element is found, evaluate _exceptionBlock_, with the 'bounding' elements (or nil) as optional arguments.
