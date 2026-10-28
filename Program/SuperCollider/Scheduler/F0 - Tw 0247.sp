/* https://sccode.org/1-4Qy ; f0 ; 0247 */
let i = 0;
{ :nextDelay |
	let j = i // 100 + 1;
	let o = blip(i * j % [99, 98, 97, 96] + 1,
		i * j % [98, 97, 96, 95] + 1
	);
	i := i + 1;
	release(
		splay2(o) * 0.05,
		0.12, 0, 8
	)
}.playEvery {
	0.12
}
