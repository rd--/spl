@UserEventTarget {

	addEventListener { :self :aString :aFunction/1 |
		self.eventListeners.atIfPresentIfAbsent(aString) { :aSet |
			aSet.add!(aFunction/1)
		} {
			self.eventListeners[aString] := IdentitySet[aFunction/1]
		}
	}

	dispatchEvent { :self :event |
		self.eventListeners.atIfPresent(event.type) { :aSet |
			aSet.do { :f/1 |
				f(event)
			}
		}
	}

}
