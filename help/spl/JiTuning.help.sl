# JiTuning - tuning type

A type representing a just-intonation (Ji) tuning.

When initializing this type,
the tuning may be given as either
a sequence of Fractions,
in which case they are understood to be ratios and the first ratio should be one,
or as a sequence of integers,
in which case they are understood to be integer pitches.

	[1, 8:7, 4:3, 14:9, 16:9].JiTuning.integerPitches = [63, 72, 84, 98, 112]
	[63, 72, 84, 98, 112].JiTuning.ratios = [1, 8:7, 4:3, 14:9, 16:9]

_Rationale:_
The degree and limit are cached since this type is used to construct a large dictionary of tunings.
