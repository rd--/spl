Env {

	asArray { :self |
		self.coordinateArrayForEnvGen
	}

	asEnvGen { :self :gate |
		EnvGen(gate, 1, 0, 1, 0, self.asArray)
	}

	coordinateArrayForEnvGen { :self |
		<primitive: return sc.envCoord(_self);>
	}

}

+ Object {

	Env { :levels :times :curves :releaseNode :loopNode :offset |
		<primitive: return new sc.Env(_levels, _times, _curves, _releaseNode, _loopNode, _offset);>
	}

}
