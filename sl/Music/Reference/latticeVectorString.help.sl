# latticeVectorString -- tuning

- _latticeVectorString(aFraction, limit)_

Print string for tuning lattice vector for _aFraction_ up to _limit_.
Entries indicate the multiplicity of the prime in either the numerator (positive) or denominator (negative).
The two (octave) column is elided, the first column is three (perfect fifth).

        9:7.latticeVectorString(13) = ' 2  0 -1  0  0'
        11:5.latticeVectorString(13) = ' 0 -1  0  1  0'
        17:13.latticeVectorString(13) = '*'
