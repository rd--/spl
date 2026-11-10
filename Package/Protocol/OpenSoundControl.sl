/* Requires: ByteArray */

OscParameter : [Object, Store] {

	| typeLetter value |

	OscParameter { :self |
		self
	}

	encodeRecord { :self |
		(
			type: self.typeLetter,
			value: self.value
		)
	}

}

+ByteArray {

	OscParameter { :self |
		OscParameter('b', self)
	}

}

+Float {

	OscParameter { :self |
		self.isIntegerValuedNumber.if {
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

OscMessage : [Object, Store] {

	| address parameterList |

	encode { :self |
		self.encodeRecord.basicEncodeOscMessage
	}

	encodeRecord { :self |
		(
			address: self.address,
			args: self.parameterList.collect(encodeRecord/1)
		)
	}

}

+String {

	OscMessage { :self :parameterList |
		newOscMessage().initializeSlots(
			self,
			parameterList.collect(OscParameter/1)
		)
	}

}

OscBundle : [Object, Store] {

	| time messageList |

	encode { :self |
		self.encodeRecord.basicEncodeOscBundle
	}

	encodeRecord { :self |
		(
			timeTag: (native: self.time * 1000),
			packets: self.messageList.collect(encodeRecord/1)
		)
	}

}

+Float {

	OscBundle { :self :messageList |
		newOscBundle().initializeSlots(self, messageList)
	}

}

+Record {

	basicEncodeOscBundle { :self |
		<primitive: return osc.writeBundle(_self, { metadata: true });>
	}

	basicEncodeOscMessage { :self |
		<primitive: return osc.writeMessage(_self, { metadata: true });>
	}

}
