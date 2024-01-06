(* Splay2 ; texture (Play) *)
{ :tr |
	let k = 7;
	let o = SinOsc({ TiRand(40, 90, tr).MidiCps } ! k, 0);
	let a = { TRand(0.05, 0.1, tr) } ! k;
	Splay2(o * a)
}.OverlapTexture(6, 3, 3).Mix

(* ---- Splay2 ; texture ; requires=eval *)
{
	let k = 7;
	let o = SinOsc({ IRand(40, 90).MidiCps } ! k, 0);
	let a = { Rand(0.05, 0.1) } ! k;
	Splay2(o * a)
}.overlap(6, 3, 3)
