# LsUnfold

- _LsUnfold(aBlock:/1, start)_
- _LsUnfold(α, β, γ)_ ⟹ _LsUnfold(α, β).take(γ)_

Answer a stream that is first _start_, and applies _aBlock_ to the previous value to derive each next value.

	LsUnfold({ :each | each + 1 }, 1, 9).upToEnd = [1 .. 9]

* * *

See also: LsCollect, LsSelect
