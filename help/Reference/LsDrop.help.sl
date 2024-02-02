# LsDrop

- _LsDrop(α, β)_ ⟹ _α.drop(β)_

Answer a stream that skips the first β elements of α.

	LsDrop(LsSeries(1, 1, 9), 3).upToEnd = [4 .. 9]

* * *

See also: drop, LsTake
