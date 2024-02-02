# caseOfOtherwise -- casing

- _caseOfOtherwise(anObject, aCollection, otherwiseBlock:/1)_

The elements of _aCollection_ are associations between blocks.
Answer the evaluated value of the first association whose evaluated key equals _anObject_.
If no match is found, answer the result of evaluating _otherwiseBlock(anObject)_.

* * *

See also: caseOf
