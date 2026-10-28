/* https://scsynth.org/t/5296 ; tm881 */
{ saw({ rand(33, 2000) } ! 2 * xLine(rand(0.125, 8), rand(0.125, 8), 60)) } !+ 99 / 99

/* https://scsynth.org/t/5296 ; tm881 ; rd edit */
{
	let f = { rand(33, 2000) } ! 2 * tRand(0.125, 4, impulse(1 / 10, 0));
	let t = impulse(1 / 2 * tRand(0.125, 4, impulse(1 / 5, 0)), 0);
	let a = perc(t, 0.01, 1, -4);
	freeVerb(saw(f) * a, 0.33, 0.5, 0.5)
} !> 16 * 0.1

/* https://scsynth.org/t/5296 ; tm881 */
let a = blip(
	[
		rand(1, 30),
		tRand(0.125, 4, impulse([1 / 4, 1 / 7], 0)),
		xLine(rand(0.125, 4), rand(0.125, 4), 15)
	].product,
	200
);
let r = gVerb(saw(322) * a, 10, 0.3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300);
r.transpose.sum * 0.25
