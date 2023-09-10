[
	Package('Music'),
	Package('Sound-Osc'),
	Package('Sound-Sc-Lang'),
	Package('Sound-Sc-Lang-J'),
	Package('Sound-Sc-Synth'),
	Package('Sound-Sc-Synth-bindings'),
	Package('Sound-Sc-Synth-pseudo')
].loadPackages.then { :unusedValue |
	system::clock := Clock()
}
