/* Requires: Clock Ugen */

TextureProgram : [Object] {

	| iterationCounter soundFunction envelopeFunction delayTimeFunction | <Integer>

	play { :self |
		{ :currentTime |
			self.envelopeFunction.unaryApply(
				self.soundFunction.cull(
					self.iterationCounter
				)
			).playAt(currentTime);
			self.iterationCounter := self.iterationCounter + 1L;
			self.delayTimeFunction.nullaryApply
		}.schedule
	}

}

+Function {

	TextureProgram { :soundFunction/0 :envelopeFunction/1 :delayTime/0 |
		uncheckedTextureProgram(
			0L,
			soundFunction/0,
			envelopeFunction/1,
			delayTime/0
		)
	}

}

+[List, Float, Ugen] {

	withOverlapEnvelope { :aUgen :sustainTime :transitionTime |
		let env = Env(
			[0, 1, 1, 0],
			[transitionTime, sustainTime, transitionTime],
			'sin',
			nil,
			nil,
			0
		);
		let amp = envGen(1, 1, 0, 1, 2, env);
		out(0, aUgen * amp)
	}

}

+Function {

	overlapTextureProgram { :self :sustainTime :transitionTime :overlap |
		let delayTime = (sustainTime + (transitionTime * 2)) / overlap;
		let envelopeFunction = { :sound |
			sound.withOverlapEnvelope(
				sustainTime,
				transitionTime
			)
		};
		TextureProgram(self, envelopeFunction/1, { delayTime })
	}

	playEvery { :self/1 :delayTime/0 :aClock |
		{ :currentTime :nextDelay |
			self(nextDelay).playAt(currentTime)
		}.repeatEvery(delayTime/0, aClock)
	}

	playEvery { :self/1 :delayTime/0 |
		playEvery(self/1, delayTime/0, system.clock)
	}

	spawnTextureProgram { :self :nextTime |
		TextureProgram(self, identity/1, nextTime)
	}

	xFadeTextureProgram { :self :sustainTime :transitionTime |
		self.overlapTextureProgram(sustainTime, transitionTime, 2)
	}

}

+@At {

	collectTextureProgram { :self :soundFunction/1 :delayTime/0 |
		let index = 1;
		let endIndex = self.size;
		self.isEmpty.if {
			self.error('collectTextureProgram: empty collection')
		} {
			TextureProgram(
				{
					let answer = soundFunction(self[index]);
					index := index + 1;
					answer
				},
				identity/1,
				{
					(index > endIndex).if {
						nil
					} {
						delayTime()
					}
				}
			)
		}
	}

}
