/* https://twitter.com/alln4tural/status/99846300173991936 ; graph rewrite ; packet size */
let k = 64;
{ :tr |
	let h = tChoose(tr, [33 38 40]).midiCps * (2 ^ tChoose(tr, [0 .. 5]));
	{
		sinOsc(tExpRand(h - (h / 256), h + (h / 256), tr), 0) * 0.025
	} !^ k
}.overlapTexture(1, 9, 5).mix

/* https://twitter.com/alln4tural/status/99846300173991936 ; graph rewrite ; packet size */
let k = 40;
{ :tr |
	let h = tChoose(tr, [33 38 40]).midiCps * (2 ^ tChoose(tr, [0 .. 4]));
	{
		sinOsc(tExpRand(h - (h / 64), h + (h / 64), tr), 0) * 0.025
	} !^ 8
}.overlapTexture(1, 9, k).mix

/* https://twitter.com/alln4tural/status/1529413845231587328 (an) ; edit (rd) ; packet size */
let k = 23;
[0 .. k].collect { :k |
	[0 .. 7].collect { :i |
		let ph = [
			sinOsc({ i * k ^ i / (2 ^ [-2 .. 4].atRandom) } ! 2, 0),
			decay(dust(1 / 4 ^ i), sinOsc(0.1, 0) + k + i),
			k * 999
		].product;
		sinOsc(i * k * k, ph)
	}.product
}.mix
