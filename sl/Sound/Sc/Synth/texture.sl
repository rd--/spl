Procedure {

	overlap { :self:/0 :sustainTime :transitionTime :overlap |
		| period = (sustainTime + (transitionTime * 2)) / overlap; |
		system::clock.schedule(0) {
			{ self().withOverlapEnvelope(sustainTime, transitionTime) }.play;
			period
		}
	}

	OverlapTexture { :self :sustainTime :transitionTime :overlap |
		<primitive: return sc.OverlapTexture(_self, _sustainTime, _transitionTime, _overlap);>
	}

	playEvery { :self :aClock :delay |
		(* Play variant of repeatEvery. *)
		if(self.numArgs = 0) {
			{ self.play }.repeatEvery(aClock, delay)
		} {
			{ : d | { self.value(d) }.play }.repeatEvery(aClock, delay)
		}
	}

	playEvery { :self :delay |
		self.playEvery(system::clock, delay)
	}

	repeatEvery { :self :aClock :delay |
		(*
			Schedule myself at intervals given by delay.
			If I accept an argument it will be the delay interval before I will execute next.
		*)
		aClock.schedule(0) {
			| nextDelay = delay.value; |
			if(nextDelay.notNil) {
				self.cull(nextDelay);
				nextDelay
			} {
				nil
			}
		}
	}

	recurseEvery { :self:/1 :aClock :anObject :delay |
		aClock.scheduleInjecting(0, anObject) { :inputValue |
			| nextDelay = delay.value; |
			(inputValue.notNil & { nextDelay.notNil }).ifTrue {
				[nextDelay, self(inputValue)]
			}
		}
	}

	recurseEvery { :self :anObject :delay |
		self.recurseEvery(system::clock, anObject, delay)
	}

	xfade { :self :sustainTime :transitionTime |
		self.overlap(sustainTime, transitionTime, 2)
	}

	XFadeTexture { :self :sustainTime :transitionTime |
		<primitive: return sc.XFadeTexture(_self, _sustainTime, _transitionTime);>
	}

}

+ @Collection {

	collectTexture { :self :aClock :aProcedure:/1 :delay |
		| end = self.size; |
		{ :i |
			{
				aProcedure(self[i])
			}.play;
			if(i = end) { nil } {  i + 1 }
		}.recurseEvery(aClock, 1, delay)
	}

	collectTexture { :self :aProcedure :delay |
		self.collectTexture(system::clock, aProcedure, delay)
	}

}

+ [Array, Number, Ugen] {

	withOverlapEnvelope { :aUgen :sustainTime :transitionTime |
		| env amp |
		env := Env([0,1,1,0], [transitionTime,sustainTime,transitionTime], 'sin', nil, nil, 0);
		amp := EnvGen(1, 1, 0, 1, 2, env.asArray);
		Out(0, aUgen * amp)
	}

}
