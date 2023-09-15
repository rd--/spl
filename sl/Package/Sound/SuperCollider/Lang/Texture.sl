(* Requires: Time-Clock *)

+Procedure {

	overlap { :self:/0 :sustainTime :transitionTime :overlap |
		| period = (sustainTime + (transitionTime * 2)) / overlap; |
		system.clock.schedule(0) { :currentTime |
			{
				self().withOverlapEnvelope(sustainTime, transitionTime)
			}.playAt(currentTime + 0.5); (* fixed delay... *)
			period
		}
	}

	playEvery { :self:/1 :delay |
		system.clock.playEvery(self:/1, delay)
	}

	recurseEvery { :self:/2 :anObject :delay |
		system.clock.recurseEvery(self:/2, anObject, delay)
	}

	xfade { :self :sustainTime :transitionTime |
		self.overlap(sustainTime, transitionTime, 2)
	}

}

+Clock {

	collectTexture { :self :aCollection :aProcedure:/1 :delay |
		| end = aCollection.size; |
		self.recurseEvery({ :currentTime :index |
			{
				aProcedure(aCollection[index])
			}.playAt(currentTime + 0.5); (* fixed delay... *)
			(index = end).if {
				nil
			} {
				index + 1
			}
		}, 1, delay.value)
	}

	playEvery { :self :aProcedure:/1 :delay |
		self.repeatEvery({ :currentTime :nextDelay |
			{
				aProcedure(nextDelay)
			}.playAt(currentTime + 0.5) (* fixed delay... *)
		}, delay)
	}

}

+@Collection {

	collectTexture { :self :aProcedure:/1 :delay |
		system.clock.collectTexture(
			self,
			aProcedure:/1,
			delay
		)
	}

}
