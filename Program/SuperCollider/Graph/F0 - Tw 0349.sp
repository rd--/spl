/* http://sccode.org/1-4Qy (F0) ; 0349 */
let c = {
	dseq(Infinity, [5 1 3 2])
};
let e = 1 / [8 4];
let f = duty(e, 0, c() * duty(e / 4, 0, c())) * duty(1 / e, 0, c() * 28.8);
sinOsc(f, 0) * sinOsc(e / 9, 0)
