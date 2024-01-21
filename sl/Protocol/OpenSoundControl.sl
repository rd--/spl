{- Requires: ByteArray -}

OscParameter : [Object] { | typeTag value |

	dictionary { :self |
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

	dictionary { :self |
		(
			address: self.address,
			args: self.parameterArray.collect(dictionary:/1)
		)
	}

	encode { :self |
		<primitive:
		return sc.encodeServerPacket(
			_dictionary_1(_self),
			{metadata: true}
		);
		>
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
