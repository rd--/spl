/* sc-140 ; 15 ; Jason Dixon */
let x = {
	lfNoise2(3).clip(0, 1) * 0.02990 + 0.00001
} ! 5;
friction(lfTri(50, 0), x, 0.414, 0.313, x * 30000, 1).splay
