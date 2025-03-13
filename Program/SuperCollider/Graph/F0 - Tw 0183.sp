/* https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0183 */
0:7.collect { :i |
	Splay(
		0:7.collect { :j |
			let a = i * 2 + j / 12;
			CombC(
				SinOsc(j + 1 * 99, 0),
				1,
				SinOsc(a, 0) / 2 + 0.5,
				1
			) * SinOsc(
				i + j * 99 + 99,
				0
			) * SinOsc(a / 3, 0)
		}
	)
}.mean.Tanh
