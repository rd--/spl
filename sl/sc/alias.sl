+ Object {
	LfNoise0 { arg freq; <primitive: return sc.LFNoise0(_freq);> }
	LfNoise1 { arg freq; <primitive: return sc.LFNoise1(_freq);> }
	LfNoise2 { arg freq; <primitive: return sc.LFNoise2(_freq);> }
}

+ @SequenceableCollection {
	scramble { :self | self.shuffled }
}
