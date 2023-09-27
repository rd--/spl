@UserEventTarget {

	addEventListener { :self :aString :aBlock:/1 |
		self.eventListeners.atIfPresentIfAbsent(aString) { :aSet |
			aSet.add(aBlock:/1)
		} {
			self.eventListeners[aString] := Set([aBlock:/1])
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
