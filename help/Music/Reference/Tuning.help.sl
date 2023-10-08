# Tuning -- music trait

A Tuning is a sequence of intervals, one of which is marked especially as the _octave_ interval.

The intervals are each given in relation to a reference tone, and may be expressed as either _ratios_ or _cents_.

The _size_ of a tuning is the number of intervals it contains, excluding the octave interval.

A tuning _isRational_ if all of the intervals, expressed as ratios, are rational numbers.

A _limit_ of a rational tuning is the largest prime factor of any interval.

The _integers_ of a rational tuning are the ratios divided by their greatest common divisor.

A tuning may have a _name_ and a _description_.

A _RatioTuning_ is a type where the intervals are stored as ratios, which may or may not be rational numbers.

A _CentsTuning_ is a type where the intervals are stored as cents.

* * *

See also: cents, CentsTuning, isRational, limit, octave, RatioTuning, ratios, size
