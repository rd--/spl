/* https://sccode.org/1-4Qy ; F0 ; 0004 */
{ :currentTime |
	let z = (6 -- 26).atRandom;
	let d = 26 - z;
	let y = lfTri(z, 0).abs / 9 / z;
	let s = rlpf(tDuty(y, 0, y), z * 600, 0.06);
	release(
		eqPan(s, 0) * 4.5,
		d, 0, z
	).playAt(currentTime);
	d
}.schedule
