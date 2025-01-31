Box : [Object] { | contents |

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+@Object {

	Box { :self |
		newBox().initializeSlots(self)
	}

}
