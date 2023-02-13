+ Procedure {

	overlap { :self:/0 :sustainTime :transitionTime :overlap |
		| period = (sustainTime + (transitionTime * 2)) / overlap; |
		workspace::clock.schedule(0) {
			{
				self().withOverlapEnvelope(sustainTime, transitionTime)
			}.play;
			period
		}
	}

	playEvery { :self :delay |
		workspace::clock.playEvery(self, delay)
	}

	recurseEvery { :self :anObject :delay |
		workspace::clock.recurseEvery(self, anObject, delay)
	}

	xfade { :self :sustainTime :transitionTime |
		self.overlap(sustainTime, transitionTime, 2)
	}

}
