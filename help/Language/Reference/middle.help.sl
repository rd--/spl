# middle -- accessing

- _middle(aSequence)_

Answer the middle element of _aSequence_.
If the length is even answer the second of the two middle items.
Signal an error if the sequence is empty.

	1:7.middle = 4
	1:8.middle = 5
	{ [].middle }.ifError { true }

* * *

See also: first, last, median, second, third
