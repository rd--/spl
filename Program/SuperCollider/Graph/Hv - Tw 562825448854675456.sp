/* http://twitter.com/HernaniVillase/status/562825448854675456 ; requires=kr ; edit (rd) */
{
	let o = lfTri(sequencer([999 99 4000], impulse(10, 0)).kr, 0);
	allpassC(o * dust(sequencer([1 5], impulse(1, 0))).kr, 0.2, 0.02, 1)
} ! 2
