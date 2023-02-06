ScSynth : [Object] {

	reset { :self |
		<primitive: return sc.resetScSynth(_self);>
	}

}

+ System {

	defaultScSynth { :self |
		<primitive: return globalScSynth;>
	}

}
