/* Requires: ByteArray */

OscParameter : [Object, Storeable] { | typeLetter value |

	asRecord { :self |
		(
			type: self.typeLetter,
			value: self.value
		)
	}

	asOscParameter { :self |
		self
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

OscMessage : [Object, Storeable] { | address parameterList |

	asRecord { :self |
		(
			address: self.address,
			args: self.parameterList.collect(asRecord:/1)
		)
	}

	encode { :self |
		self.asRecord.basicEncodeOscMessage
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

OscBundle : [Object, Storeable] { | time messageList |

	asRecord { :self |
		(
			timeTag: (native: self.time * 1000),
			packets: self.messageList.collect(asRecord:/1)
		)
	}

	encode { :self |
		self.asRecord.basicEncodeOscBundle
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
