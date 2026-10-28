/* https://sccode.org/1-4Qy ; F0 ; 0247 */
[0 .. 137].collectTextureProgram { :i |
	let j = i // 100 + 1;
	let o = blip(
		i * j % [99 98 97 96] + 1,
		i * j % [98 97 96 95] + 1
	);
	release(o.splay * 0.05, 0.12, 0, 8)
} { 0.12 }
