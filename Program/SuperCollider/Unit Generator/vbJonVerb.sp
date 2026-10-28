/* vbJonVerb */
let freq = [1, 2.1, 2.9].collect { :item |
	item * 1000
};
let src = resonz({ dust(0.25) } ! 3, freq, 0.01).sum * 10;
vbJonVerb(src, 0.8, 0.3, 0.8, 0.1, 0.5) + src

/* vbJonVerb ; default param */
vbJonVerb(dust(2), 0.7, 0.3, 0.8, 0.5, 0.5)
