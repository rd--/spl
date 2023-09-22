Env! : [Object] {

	asArray { :self |
		self.coordinateArrayForEnvGen
	}

	asEnvGen { :self :gate |
		EnvGen(gate, 1, 0, 1, 0, self.coordinateArrayForEnvGen)
	}

	asEnvGenWithDoneAction { :self :gate :doneAction |
		EnvGen(gate, 1, 0, 1, doneAction, self.coordinateArrayForEnvGen)
	}

	coordinateArrayForEnvGen { :self |
		<primitive: return sc.envCoord(_self);>
	}

	pseudoSlotNameArray { :self |
		['levels', 'times', 'curves', 'releaseNode', 'loopNode', 'offset']
	}

}
