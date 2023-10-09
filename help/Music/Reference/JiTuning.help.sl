# JiTuning -- instance creation-tuning

- _JiTuning(name, description, ratiosOrIntegers, octave, limit)_

Answers a _RatioTuning_ representing a just-intonation (Ji) tuning.

The tuning may be given as either
a sequence of Fractions,
in which case they are understood to be ratios and the first ratio should be 1:1,
or as a sequence of integers,
in which case they are understood to be integer pitches.

	[1:1, 8:7, 4:3, 14:9, 16:9].JiTuning.integers = [63, 72, 84, 98, 112]
	[63, 72, 84, 98, 112].JiTuning.ratios = [1:1, 8:7, 4:3, 14:9, 16:9]

* * *

See also: IntegerTuning, RatioTuning, Tuning
