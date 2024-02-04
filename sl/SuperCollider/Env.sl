Env! : [Object] {

	asList { :self |
		self.coordinateListForEnvGen
	}

	asEnvGen { :self :gate |
		EnvGen(gate, 1, 0, 1, 0, self.coordinateListForEnvGen)
	}

	asEnvGenWithDoneAction { :self :gate :doneAction |
		EnvGen(gate, 1, 0, 1, doneAction, self.coordinateListForEnvGen)
	}

	circle { :self :timeFromLastToFirst :curve |
		let first0Then1 = Latch(1, Impulse(0, 0));
		self.releaseNode.isNil.if {
			self.levels := [0] ++ self.levels ++ [0];
			self.curves := [curve] ++ self.curves.asList.wrapExtend(self.times.size) ++ ['lin'];
			self.times  := [first0Then1 * timeFromLastToFirst] ++ self.times ++ [inf];
			self.releaseNode := self.levels.size - 2
		} {
			self.levels := [0] ++ self.levels;
			self.curves := [curve] ++ self.curves.asList.wrapExtend(self.times.size);
			self.times  := [first0Then1 * timeFromLastToFirst] ++ self.times;
			self.releaseNode := self.releaseNode + 1
		};
		self.loopNode := 0;
		self
	}

	coordinateListForEnvGen { :self |
		<primitive: return sc.envCoord(_self);>
	}

	levels { :self | <primitive: return _self.levels;> }
	times { :self | <primitive: return _self.times;> }
	curves { :self | <primitive: return _self.curves;> }
	releaseNode { :self | <primitive: return _self.releaseNode;> }
	loopNode { :self | <primitive: return _self.loopNode;> }

	levels { :self :anObject | <primitive: _self.levels = _anObject; return _anObject;> }
	times { :self :anObject | <primitive: _self.times = _anObject; return _anObject;> }
	curves { :self :anObject | <primitive: _self.curves = _anObject; return _anObject;> }
	releaseNode { :self :anObject | <primitive: _self.releaseNode = _anObject; return _anObject;> }
	loopNode { :self :anObject | <primitive: _self.loopNode = _anObject; return _anObject;> }

	pseudoSlotNameList { :self |
		['levels', 'times', 'curves', 'releaseNode', 'loopNode', 'offset']
	}

}
