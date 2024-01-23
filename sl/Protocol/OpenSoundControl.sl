{- Requires: ByteArray -}

OscParameter : [Object] { | typeTag value |

	asRecord { :self |
		(
			type: self.typeTag,
			value: self.value
		)
	}

	OscParameter { :self |
		self
	}

}

+ByteArray {

	OscParameter { :self |
		OscParameter('b', self)
	}

}

+SmallFloat {

	OscParameter { :self |
		self.isInteger.if {
			OscParameter('i', self)
		} {
			OscParameter('f', self)
		}
	}

}

+String {

	OscParameter { :self |
		OscParameter('s', self)
	}

	OscParameter { :self :anObject |
		newOscParameter().initializeSlots(self, anObject)
	}

}


OscMessage : [Object] { | address parameterArray |

	asRecord { :self |
		(
			address: self.address,
			args: self.parameterArray.collect(asRecord:/1)
		)
	}

	encode { :self |
		<primitive: return sc.encodeOscMessage(_asRecord_1(_self));>
	}

}

+String {

	OscMessage { :self :parameterArray |
		newOscMessage().initializeSlots(
			self,
			parameterArray.collect(OscParameter:/1)
		)
	}

}

OscBundle : [Object] { | time messageArray |

	asRecord { :self |
		(
			timeTag: (native: self.time * 1000),
			packets: self.messageArray.collect(asRecord:/1)
		)
	}

}

+SmallFloat {

	OscBundle { :self :messageArray |
		newOscBundle().initializeSlots(self, messageArray)
	}

}
