/* 20061015 ; rd ; requires=EnvBreakPoint */
let ls = { :ts :bp |
	envGen(1, 1, 0, ts, 2, envBreakPoint(bp, 0))
};
{
	let ts = 21;
	let f = ls(ts, [{ rand(50, 55) } ! 2, 0.33, { rand(50, 65) } ! 2, 1, { rand(50, 55) } ! 2]);
	let g = ls(ts, [0, 0.33, { rand(0.01, 0.035) } ! 2, 1, 0]);
	saw(f) * g
} !> 8
