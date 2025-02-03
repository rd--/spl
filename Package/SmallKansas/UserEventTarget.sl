@UserEventTarget {

	addEventListener { :self :aString :aBlock:/1 |
		self.eventListeners.atIfPresentIfAbsent(aString) { :aSet |
			aSet.add(aBlock:/1)
		} {
			self.eventListeners[aString] := [aBlock:/1].asIdentitySet
		}
	}

	dispatchEvent { :self :event |
		self.eventListeners.atIfPresent(event.type) { :aSet |
			aSet.do { :each |
				each.value(event)
			}
		}
	}

}
