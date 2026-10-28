/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0183 */
[0 .. 7].collect { :i |
	splay(
		[0 .. 7].collect { :j |
			let a = i * 2 + j / 12;
			combC(
				sinOsc(j + 1 * 99, 0),
				1,
				sinOsc(a, 0) / 2 + 0.5,
				1
			) * sinOsc(
				i + j * 99 + 99,
				0
			) * sinOsc(a / 3, 0)
		}
	)
}.mean.tanh
