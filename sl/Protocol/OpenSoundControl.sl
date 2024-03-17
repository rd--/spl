{- Requires: ByteArray -}

OscParameter : [Object] { | typeLetter value |

	asRecord { :self |
		(
			type: self.typeLetter,
			value: self.value
		)
	}

	asOscParameter { :self |
		self
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+ByteArray {

	asOscParameter { :self |
		OscParameter('b', self)
	}

}

+SmallFloat {

	asOscParameter { :self |
		self.isInteger.if {
			OscParameter('i', self)
		} {
			OscParameter('f', self)
		}
	}

}

+String {

	asOscParameter { :self |
		OscParameter('s', self)
	}

	OscParameter { :self :anObject |
		newOscParameter().initializeSlots(self, anObject)
	}

}

OscMessage : [Object] { | address parameterList |

	asRecord { :self |
		(
			address: self.address,
			args: self.parameterList.collect(asRecord:/1)
		)
	}

	encode { :self |
		<primitive: return sc.encodeOscMessage(_asRecord_1(_self));>
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+String {

	OscMessage { :self :parameterList |
		newOscMessage().initializeSlots(
			self,
			parameterList.collect(asOscParameter:/1)
		)
	}

}

OscBundle : [Object] { | time messageList |

	asRecord { :self |
		(
			timeTag: (native: self.time * 1000),
			packets: self.messageList.collect(asRecord:/1)
		)
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+SmallFloat {

	OscBundle { :self :messageList |
		newOscBundle().initializeSlots(self, messageList)
	}

}
