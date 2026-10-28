/* Narrow band filtered crackle noise (Jmcc) #2 ; Graph rewrite */
{ :tr |
	let rf1 = tRand(0, 2000, tr) + 80;
	let rf2 = rf1 + (tRand(-0.2, 0.2, tr) * rf1);
	let rf = txLine(rf1, rf2, 9, tr);
	let c = crackle(1.97 + tRand(0, 0.03, tr));
	eqPan2(resonz(c, rf, 0.2), tRand(-1, 1, tr))
}.overlapTexture(2, 5, 4).mix * 0.15 /* C.f. 5, 2, 5 */
