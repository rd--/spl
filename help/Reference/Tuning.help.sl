# Tuning

A `Tuning` is a sequence of intervals, one of which is marked especially as the `octave` interval.

The intervals are each given in relation to a reference tone, and may be expressed as either `ratios` or `cents`.

The `size` of a tuning is the number of intervals it contains, excluding the octave interval.

A tuning `isRational` if all of the intervals, expressed as ratios, are rational numbers.

The `limit` of a rational tuning is the largest prime factor of any interval.

The `integers` of a rational tuning are the ratios divided by their greatest common divisor.

A tuning may have a `name` and a `description`.

A `RatioTuning` is a type where the intervals are stored as ratios, which may or may not be rational numbers.

A _CentsTuning_ is a type where the intervals are stored as cents.

* * *

See also: cents, CentsTuning, isRational, limit, octave, RatioTuning, ratios, size

Categories: Music, Trait
