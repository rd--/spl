/* convolution */
let tr = dust(100);
{
	let freq = tRand(2700, 2750, tr);
	let amp = tRand(0.1, 0.2, tr);
	hpf(amp * convolution(saw(freq), tr, 512), 10000)
} !^ 4
