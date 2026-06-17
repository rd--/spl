# Experimental AtPath Syntax

- _a[i₁, i₂ …]_ -> _a.atPath([i₁, i₂])_

_Rationale_:
For `List` matrices and arrays,
the notation _a[i][j]_ fetches the cell at the _j_-th column of the _i_-th row.
`NumericArray` does not implement `at`.

_History_:
Previously there were multiple arity forms of `at` for low dimensional arrays,
and this syntax translated to these forms,
that is _a[i,j]_ translated as _a.at(i,j)_.
