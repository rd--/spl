ContinuousEvent : [Object] { | contents |

	asArray { :self |
		self.contents
	}

	i { :self |
		self.contents[5]
	}

	j { :self |
		self.contents[6]
	}

	k { :self |
		self.contents[7]
	}

	p { :self |
		self.contents[8]
	}

	w { :self |
		self.contents[1]
	}

	x { :self |
		self.contents[2]
	}

	y { :self |
		self.contents[3]
	}

	z { :self |
		self.contents[4]
	}

}

+Array {

	asContinuousEvent { :self |
		self.assertIsOfSize(8);
		newContinuousEvent().initializeSlots(self.kr) (* control rate? *)
	}

}

+Void {

	ContinuousEvent {
		[0 0 0 0 0 0 0 0].asContinuousEvent
	}

}

+@Dictionary {

	asContinuousEvent { :self |
		[
			self::w :? { 0 },
			self::x :? { 0 },
			self::y :? { 0 },
			self::z :? { 0 },
			self::i :? { 0 },
			self::j :? { 0 },
			self::k :? { 0 },
			self::p :? { 0 }
		].asContinuousEvent
	}

	Voicer { :self :aBlock:/1 |
		self.multiChannelExpand.collect { :each |
			aBlock(each.asContinuousEvent)
		}
	}

}

+@Integer {

	voicerVoiceAddress { :part :voice |
		| addrZero = 13000, maxEventParam = 10, maxVoices = 24; |
		addrZero + (part - 1 * maxVoices * maxEventParam) + (voice - 1 * maxEventParam)
	}

	Voicer { :part :voice :voiceBlock:/1 |
		(1 .. voice).collect { :each |
			| bus = part.voicerVoiceAddress(each); |
			ControlIn(8, bus).asContinuousEvent.voiceBlock
		}
	}

}

+@Integer {

	VoiceWriter { :part :numVoices :voiceBlock:/0 |
		(1 .. numVoices).collect { :voice |
			ControlOut(
				part.voicerVoiceAddress(voice),
				voiceBlock().asContinuousEvent.asArray
			)
		}
	}

}

+[SmallFloat, Array] {

	KeyDown { :voiceNumber | <primitive: return sc.KeyDown(_voiceNumber);> }
	KeyTimbre { :voiceNumber | <primitive: return sc.KeyTimbre(_voiceNumber);> }
	KeyPressure { :voiceNumber | <primitive: return sc.KeyPressure(_voiceNumber);> }
	KeyVelocity { :voiceNumber | <primitive: return sc.KeyVelocity(_voiceNumber);> }
	KeyPitch { :voiceNumber | <primitive: return sc.KeyPitch(_voiceNumber);> }

	PenDown { :voiceNumber | <primitive: return sc.PenDown(_voiceNumber);> }
	PenX { :voiceNumber | <primitive: return sc.PenX(_voiceNumber);> }
	PenY { :voiceNumber | <primitive: return sc.PenY(_voiceNumber);> }
	PenZ { :voiceNumber | <primitive: return sc.PenZ(_voiceNumber);> }
	PenAngle { :voiceNumber | <primitive: return sc.PenAngle(_voiceNumber);> }
	PenRadius { :voiceNumber | <primitive: return sc.PenRadius(_voiceNumber);> }

}
