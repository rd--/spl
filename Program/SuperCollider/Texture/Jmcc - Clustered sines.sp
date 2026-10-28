/* Clustered sines (Jmcc) #2 */
{
	let n = 80;
	let f1 = rand(100, 1100);
	let f2 = 4.0 * f1;
	{
		let y = { f1 + rand(0, f2) } ! n;
		let a = f1 / y;
		sinOscBank(y, a, nil) / n
	} ! 2
}.xFadeTextureProgram(4, 4)
