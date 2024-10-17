/* https://sccode.org/1-4Qy ; f0 ; 0005 */
{ :unusedCurrentTime |
	let z = (1 -- 61).atRandom;
	let d = z / 3;
	let y = LfTri(z, 0).Abs / z;
	let s = Rlpf(TDuty(y, 0, y), z * 99 + y, 0.01) * (6 + y);
	Release(EqPan(s, 0) / 3, d, 0, z).play;
	d
}.schedule
