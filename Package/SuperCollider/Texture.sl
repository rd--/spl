/* Requires: Clock Ugen */

TextureProgram : [Object] {

	| iterationCounter soundBlock envelopeBlock delayTimeBlock |

	play { :self |
		{ :currentTime |
			self.envelopeBlock.unaryApply(
				self.soundBlock.cull(
					self.iterationCounter
				)
			).playAt(currentTime);
			self.iterationCounter := self.iterationCounter + 1;
			self.delayTimeBlock.nullaryApply
		}.schedule
	}

}

+Block {

	TextureProgram { :soundBlock/0 :envelopeBlock/1 :delayTime/0 |
		newTextureProgram().initializeSlots(
			0,
			soundBlock/0,
			envelopeBlock/1,
			delayTime/0
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
		let amp = EnvGen(1, 1, 0, 1, 2, env);
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
		TextureProgram(self, envelopeBlock/1, { delayTime })
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

	collectTextureProgram { :self :soundBlock/1 :delayTime/0 |
		let index = 1;
		let endIndex = self.size;
		self.isEmpty.if {
			self.error('collectTextureProgram: empty collection')
		} {
			TextureProgram(
				{
					let answer = soundBlock(self[index]);
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
