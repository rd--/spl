/* http://twitter.com/alln4tural/status/1529413845231587328 (an) ; edit (rd) */
[1 .. 3].collect { :k |
	[1 .. 9].collect { :i |
		let ph = [
			sinOsc(
				{
					i * k ^ i / (2 ^ [-2 .. 4].atRandom)
				} ! 2,
				0
			),
			decay(dust(1 / 4 ^ i), sinOsc(0.1, 0) + k + i),
			k * 999
		].product;
		sinOsc(i * k * k, ph)
	}.product
}.mix
