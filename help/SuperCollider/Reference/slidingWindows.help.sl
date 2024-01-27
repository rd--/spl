# slidingWindows

- _slidingWindows(aSequence, windowSize, stepSize)_

Answer a sequence of arrays of _windowSize_ places,
each is a subsequence of _aSequence_,
starting _stepSize_ places after the last.

If the _stepSize_ is less than the _windowSize_ the windows will overlap:

	[1 .. 9].slidingWindows(3, 2) = [1 2 3; 3 4 5; 5 6 7; 7 8 9]

If the _stepSize_ is greater than the _windowSize_ there will be gaps:

	[1 .. 9].slidingWindows(3, 4) = [1 2 3; 5 6 7]

If the _stepSize_ is equal to the _windowSize_ the concatenation of the answer will be the orignal sequence:

	[1 .. 9].slidingWindows(3, 3) = [1 2 3; 4 5 6; 7 8 9]
	[1 .. 9].slidingWindows(3, 3).concatenation = [1 .. 9]

