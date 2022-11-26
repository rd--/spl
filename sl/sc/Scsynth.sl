Scsynth {

	reset { :self |
		<primitive: return sc.resetScsynth(_self);>
	}

}

Void {

	globalScsynth {
		<primitive: return globalScsynth;>
	}

}
