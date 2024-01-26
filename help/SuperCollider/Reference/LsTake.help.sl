# LsTake

- _LsTake(α, β)_ ⟹ _α.take(β)_

Answer a stream that answers at most β elements of α and thereafter answers _nil_.

	LsTake(LsForever(1), 9).upToEnd = [1 1 1 1 1 1 1 1 1]
	LsForever(1).take(9).upToEnd = [1 1 1 1 1 1 1 1 1]

* * *

See also: LsFin, take
