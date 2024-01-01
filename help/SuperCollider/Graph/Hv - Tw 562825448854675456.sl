(* https://twitter.com/HernaniVillase/status/562825448854675456 ; requires=kr ; edit (rd) *)
{
	var o = LfTri(DurationSequencer([999 99 4000], 0.1).kr, 0);
	AllpassC(o * Dust(DurationSequencer([1 5], 1)).kr, 0.2, 0.02, 1)
} ! 2
