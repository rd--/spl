Env! : [Object] {

	circle { :self :timeFromLastToFirst :curve |
		let first0Then1 = Latch(Dc(1), Impulse(0, 0));
		self.releaseNode.isNil.if {
			self.levels := [0] ++ self.levels ++ [0];
			self.curves := [curve] ++ self.curves.List.wrapExtend(self.times.size) ++ ['lin'];
			self.times  := [first0Then1 * timeFromLastToFirst] ++ self.times ++ [Infinity];
			self.releaseNode := self.levels.size - 2
		} {
			self.levels := [0] ++ self.levels;
			self.curves := [curve] ++ self.curves.List.wrapExtend(self.times.size);
			self.times  := [first0Then1 * timeFromLastToFirst] ++ self.times;
			self.releaseNode := self.releaseNode + 1
		};
		self.loopNode := 0;
		self
	}

	coordinateList { :self |
		<primitive: return sc.envCoord(_self);>
	}

	curves { :self |
		<primitive: return _self.curves;>
	}

	curvesMutate! { :self :anObject |
		<primitive: _self.curves = _anObject; return _anObject;>
	}

	[envToEnvGen, asEnvGenWithDoneAction] { :self :gate :doneAction |
		EnvGen(gate, 1, 0, 1, doneAction, self)
	}

	[envToEnvGen, asEnvGen] { :self :gate |
		EnvGen(gate, 1, 0, 1, 0, self)
	}

	levels { :self |
		<primitive: return _self.levels;>
	}

	levelsMutate! { :self :anObject |
		<primitive: _self.levels = _anObject; return _anObject;>
	}

	loopNode { :self |
		<primitive: return _self.loopNode;>
	}

	loopNodeMutate! { :self :anObject |
		<primitive: _self.loopNode = _anObject; return _anObject;>
	}

	pseudoSlotNameList { :self |
		['levels', 'times', 'curves', 'releaseNode', 'loopNode', 'offset']
	}

	releaseNode { :self |
		<primitive: return _self.releaseNode;>
	}

	releaseNodeMutate! { :self :anObject |
		<primitive: _self.releaseNode = _anObject; return _anObject;>
	}

	times { :self |
		<primitive: return _self.times;>
	}

	timesMutate! { :self :anObject |
		<primitive: _self.times = _anObject; return _anObject;>
	}

}
