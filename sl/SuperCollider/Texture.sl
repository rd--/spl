/* Requires: Clock Ugen */

+[List, SmallFloat, Ugen] {

	withOverlapEnvelope { :aUgen :sustainTime :transitionTime |
		let env = Env(
			[0, 1, 1, 0],
			[transitionTime, sustainTime, transitionTime],
			'sin',
			nil,
			nil,
			0
		);
		let amp = EnvGen(1, 1, 0, 1, 2, env.asList);
		Out(0, aUgen * amp)
	}

}

+Block {

	overlap { :self:/1 :sustainTime :transitionTime :overlap |
		let period = (sustainTime + (transitionTime * 2)) / overlap;
		let counter = 0;
		system.clock.schedule(0) { :currentTime |
			counter := counter + 1;
			self:/1.cull(
				counter
			).withOverlapEnvelope(
				sustainTime,
				transitionTime
			).playAt(
				currentTime + 0.5 /* fixed delay... */
			);
			period
		}
	}

	playEvery { :self:/1 :delay |
		system.clock.playEvery(self:/1, delay)
	}

	recurseEvery { :self:/2 :anObject :delay |
		system.clock.recurseEvery(self:/2, anObject, delay)
	}

	spawn { :self:/1 :nextTime |
		let counter = 0;
		system.clock.schedule(0) { :currentTime |
			counter := counter + 1;
			self:/1.cull(counter).playAt(currentTime + 0.5); /* fixed delay... */
			nextTime.value
		}
	}

	xfade { :self :sustainTime :transitionTime |
		self.overlap(sustainTime, transitionTime, 2)
	}

}

+Clock {

	collectTexture { :self :aCollection :aBlock:/1 :delay |
		let end = aCollection.size;
		self.recurseEvery({ :currentTime :index |
			aBlock(aCollection[index]).playAt(currentTime + 0.5); /* fixed delay... */
			(index = end).if {
				nil
			} {
				index + 1
			}
		}, 1, delay.value)
	}

	playEvery { :self :aBlock:/1 :delay |
		self.repeatEvery({ :currentTime :nextDelay |
			aBlock:/1.cull(nextDelay).playAt(currentTime + 0.5) /* fixed delay... */
		}, delay)
	}

}

+@Collection {

	collectTexture { :self :aBlock:/1 :delay |
		system.clock.collectTexture(
			self,
			aBlock:/1,
			delay
		)
	}

}
