Box : [Object, Equatable] { | contents |

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+@Object {

	Box { :self |
		newBox().initializeSlots(self)
	}

}
