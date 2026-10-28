/* Ar ; http://github.com/alikthename/Musical-Design-in-Supercollider ; 1 */
Voicer(1, 16) { :e |
	let withMod = true;
	let level = e.z * e.w.lagUd(0, e.y * 4 + 0.1);
	let f1 = (e.x * 36 + 48).midiCps;
	let f2 = f1.clip(50, 1500);
	let formantA = tChoose(e.w, [1 2 3]) * withMod.if { (e.k * 2).round(1).max(1) } { 1 };
	let formantB = tChoose(e.w, [3 4 5 6 7]) * withMod.if { (e.j * 4).round(1).max(1) } { 1 };
	let overlapA = tChoose(e.w, [0.5 1 2 4]) * withMod.if { e.y * 2 } { 1 };
	let overlapB = tChoose(e.w, [0.5 1 2]) * withMod.if { e.y * 2 } { 1 };
	let attackTime = f2.linLin(50, 1500, 0.1, 0.02);
	let e0 = perc(e.w, attackTime, rand(1, 7), -4);
	let e1 = e0 * pinkNoise().linLin(-1, 1, 0.1, 1).lag(0.02);
	let p = e.j * 2 - 1;
	let gTrg = impulse(f1, 0);
	let fund = grainSin(1, gTrg, overlapA * (1.05 - e1.^(1.1)) / f1, f1, p, -1, 512);
	let a = grainSin(2, gTrg, overlapA * (1.05 - e1.^(1.5)) / f1, f1 * formantA, p, -1, 512);
	let b = grainSin(2, gTrg, overlapB * (1.05 - e1.^(2.5)) / f1, f1 * formantB, p, -1, 512);
	let c1 = fund * (level * e1).^(0.7);
	let c2 = a * (level * e1).^(f2.linLin(50, 1500, 1.1, 1.5));
	let c3 = b * (level * e1).^(f2.linLin(50, 1500, 1.5, 2.5));
	leakDc([c1 c2 c3].sum, 0.995)
}.sum * 0.25
