/* Requires: Clock Ugen */

TextureProgram : [Object] { | iterationCounter soundBlock envelopeBlock delayTime |

	play { :self |
		{ :currentTime |
			self.envelopeBlock.value(
				self.soundBlock.cull(
					self.iterationCounter
				)
			).playAt(currentTime);
			self.iterationCounter := self.iterationCounter + 1;
			self.delayTime.value
		}.schedule
	}

}

+Block {

	TextureProgram { :soundBlock:/0 :envelopeBlock:/1 :delayTime |
		newTextureProgram().initializeSlots(
			0,
			soundBlock:/0,
			envelopeBlock:/1,
			delayTime
		)
	}

}

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

	overlapTextureProgram { :self :sustainTime :transitionTime :overlap |
		let delayTime = (sustainTime + (transitionTime * 2)) / overlap;
		let envelopeBlock = { :sound |
			sound.withOverlapEnvelope(
				sustainTime,
				transitionTime
			)
		};
		TextureProgram(self, envelopeBlock:/1, delayTime)
	}

	playEvery { :self:/1 :delay |
		system.clock.playEvery(self:/1, delay)
	}

	recurseEvery { :self:/2 :anObject :delay |
		system.clock.recurseEvery(self:/2, anObject, delay)
	}

	spawnTextureProgram { :self :nextTime |
		TextureProgram(self, identity:/1, nextTime)
	}

	xFadeTextureProgram { :self :sustainTime :transitionTime |
		self.overlapTextureProgram(sustainTime, transitionTime, 2)
	}

}

+Clock {

	collectTexture { :self :aCollection :aBlock:/1 :delay |
		let end = aCollection.size;
		self.recurseEvery({ :currentTime :index |
			aBlock(aCollection[index]).playAt(currentTime);
			(index = end).if {
				nil
			} {
				index + 1
			}
		}, 1, delay.value)
	}

	playEvery { :self :aBlock:/1 :delay |
		self.repeatEvery({ :currentTime :nextDelay |
			aBlock(nextDelay).playAt(currentTime)
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
