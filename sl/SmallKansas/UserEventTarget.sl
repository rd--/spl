@UserEventTarget {

	addEventListener { :self :aString :aProcedure:/1 |
		self.eventListeners.atIfPresentIfAbsent(aString) { :aSet |
			aSet.add(aProcedure:/1)
		} {
			self.eventListeners[aString] := Set([aProcedure:/1])
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
