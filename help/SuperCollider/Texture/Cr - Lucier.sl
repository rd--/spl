/* Lucier (Cr) ; http://www.listarc.bham.ac.uk/lists/sc-users/msg47539.html */
{
	let freq = Rand(56, 64);
	let blocksize = 1 / ControlRate();
	let mkDt = { :f | 1 / f - blocksize };
	let stringDelay = mkDt(freq);
	let pk1Pos = 0.1;
	let srcPos = 0.3;
	let pk2Pos = 0.9;
	let maxDelay = 1;
	let mkDelay = { :i :r | Lpz1(DelayC(i, maxDelay, r * stringDelay)) };
	let mkAllpass = { :i :r :dt | Lpz1(AllpassC(i, maxDelay, r * stringDelay, dt)) };
	let drv = LocalIn(1, 0);
	let pk1R = mkDelay(drv, srcPos - pk1Pos);
	let pk1L = mkAllpass(pk1R * -1, pk1Pos * 2, Rand(0.001, 0.11));
	let pk2L = mkDelay(pk1L, pk2Pos - pk1Pos) * 0.99;
	let stringL = mkDelay(pk2L, 1 - pk2Pos);
	let pk2R = mkAllpass(stringL * -1, 1 - pk2Pos, 2 + Rand(0.001, 0.11)) * 0.99;
	let stringR = mkDelay(pk2R, pk2Pos - srcPos);
	let source = {
		let s = SinOsc(220, 0) * 0.01;
		let a = Amplitude(drv, 0.01, 0.01) * 11;
		let p = Pulse(60 + a, 0.5) * 0.1;
		let f = Rlpf(s + p, 320, 0.05);
		let e = 1 - Amplitude(drv, 0.01, 0.01).Min(1);
		Normalizer(f, 0.7, 0.01) * e
	};
	let lOut = LocalOut(source() * 0.2 + stringR);
	let outL = pk1L + pk1R;
	let outR = pk2L + pk2R;
	[outL, outR] * 0.25 <! lOut <! drv
}.overlap(1, 5, 3)
