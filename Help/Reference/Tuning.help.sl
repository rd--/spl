# Tuning

`Tuning` is a `Trait`.

A tuning holds a sequence of intervals, one of which is marked especially as the `octave` interval.

The intervals are each given in relation to a reference tone, and may be expressed as either _cents_, _integers_ or _ratios_.

The `size` of a tuning is a positive integer counting the number of intervals it contains, excluding the octave interval.

A tuning `isRational` if all of the intervals, expressed as ratios, are rational numbers.

The `limit` of a rational tuning is the largest prime factor of any interval.

`asIntegers` of a rational tuning answers the ratios divided by their greatest common divisor.

A tuning may have a `name` and a `description`.

A `RatioTuning` is a type where the intervals are stored as ratios, which may or may not be rational numbers.

A `CentsTuning` is a type where the intervals are stored as cents.

* * *

See also: asCents, asRatios, CentsTuning, intervalMatrix, isRational, limit, octave, RatioTuning, Scale, size

Guides: Tuning Functions

Categories: Music, Trait
