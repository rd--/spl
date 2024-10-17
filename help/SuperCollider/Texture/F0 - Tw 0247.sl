/* https://sccode.org/1-4Qy ; f0 ; 0247 */
0:137.collectTexture { :i |
	let j = i // 100 + 1;
	let o = Blip(
		i * j % [99 98 97 96] + 1,
		i * j % [98 97 96 95] + 1
	);
	Release(o.Splay * 0.05, 0.12, 0, 8)
} { 0.12 }
