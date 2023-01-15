CcEvent {

	v { :self |
		<primitive: return _self.v;>
	}

	w { :self |
		<primitive: return _self.w;>
	}

	x { :self |
		<primitive: return _self.x;>
	}

	y { :self |
		<primitive: return _self.y;>
	}

	z { :self |
		<primitive: return _self.z;>
	}

	o { :self |
		<primitive: return _self.o;>
	}

	rx { :self |
		<primitive: return _self.rx;>
	}

	ry { :self |
		<primitive: return _self.ry;>
	}

	p { :self |
		<primitive: return _self.p;>
	}

}

+ Number {

	CcEvent { :self :anArray |
		<primitive: return new sc.CcEvent(_self, _anArray);>
	}

	Voicer { :self :voiceProcedure |
		<primitive: return sc.Voicer(_self, _voiceProcedure);>
	}

}

