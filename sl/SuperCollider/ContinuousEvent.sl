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

	voicerVoiceAddress { :self |
		| eventAddr = 13000, eventIncr = 10, eventZero = 0; |
		eventAddr + ((self - 1 + eventZero) * eventIncr)
	}

	Voicer { :self :voiceBlock:/1 |
		| voiceOffset = 0; |
		(1 .. self).collect { :each |
			ControlIn(8, (each + voiceOffset).voicerVoiceAddress).asContinuousEvent.voiceBlock
		}
	}

}

+@Integer {

	VoiceWriter { :self :voiceBlock:/0 |
		(1 .. self).collect { :voiceNumber |
			ControlOut(
				voiceNumber.voicerVoiceAddress,
				voiceBlock().asContinuousEvent.asArray
			)
		}
	}

}

+[Array, SmallFloat, Ugen] {

	KeyDown { :self | <primitive: return sc.KeyDown(_self);> }
	KeyTimbre { :self | <primitive: return sc.KeyTimbre(_self);> }
	KeyPressure { :self | <primitive: return sc.KeyPressure(_self);> }
	KeyVelocity { :self | <primitive: return sc.KeyVelocity(_self);> }
	KeyPitch { :self | <primitive: return sc.KeyPitch(_self);> }

	PenDown { :voiceNumber | <primitive: return sc.PenDown(_voiceNumber);> }
	PenX { :voiceNumber | <primitive: return sc.PenX(_voiceNumber);> }
	PenY { :voiceNumber | <primitive: return sc.PenY(_voiceNumber);> }
	PenZ { :voiceNumber | <primitive: return sc.PenZ(_voiceNumber);> }
	PenAngle { :voiceNumber | <primitive: return sc.PenAngle(_voiceNumber);> }
	PenRadius { :voiceNumber | <primitive: return sc.PenRadius(_voiceNumber);> }

}
