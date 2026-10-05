/* Requires: ByteArray */

OscParameter : [Object, Store] { | typeLetter value |

	OscParameter { :self |
		self
	}

	Record { :self |
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

OscMessage : [Object, Store] { | address parameterList |

	encode { :self |
		self.Record.basicEncodeOscMessage
	}

	Record { :self |
		(
			address: self.address,
			args: self.parameterList.collect(Record/1)
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

OscBundle : [Object, Store] { | time messageList |

	Record { :self |
		(
			timeTag: (native: self.time * 1000),
			packets: self.messageList.collect(Record/1)
		)
	}

	encode { :self |
		self.Record.basicEncodeOscBundle
	}

}

+SmallFloat {

	OscBundle { :self :messageList |
		newOscBundle().initializeSlots(self, messageList)
	}

}

+Record {

	basicEncodeOscMessage { :self |
		<primitive: return osc.writeMessage(_self, { metadata: true });>
	}

	basicEncodeOscBundle { :self |
		<primitive: return osc.writeBundle(_self, { metadata: true });>
	}

}
