Procedure {

	= { :self :anObject |
		self == anObject
	}

	apply { :self :anArray |
		<primitive: if(sl.isArray(_anArray)) { return _self(... _anArray); }>
		error('Procedure>>apply')
	}

	cull { :self :firstArg |
		if(self.numArgs >= 1) {
			self.value(firstArg)
		} {
			self.value
		}
	}

	cullCull { :self :firstArg :secondArg |
		if(self.numArgs >= 2) {
			self.value(firstArg, secondArg)
		} {
			if(self.numArgs = 1) {
				self.value(firstArg)
			} {
				self.value
			}
		}
	}

	ifError { :self :errorHandler |
		<primitive: try { return _self(); } catch (exc) { return _errorHandler(exc) }>
	}

	methodName { :self |
		<primitive: return _self.name.split(':')[0];>
	}

	numArgs { :self |
		(*
			Js doesn't have a proper numArgs mechanism.
			Spl adds hasRestParameters to method functions, else it is undefined.
			From within Spl there is no concept of a variadic procedure.
		*)
		<primitive: return _self.hasRestParameters ? null : _self.length;>
	}

	name { :self |
		<primitive: return _self.name;>
	}

	withReturn { :self |
		<primitive: try { return _self(); } catch (ret) { if(ret instanceof Error) { throw(ret); } { return ret; } }>
	}

	value { :self |
		apply(self, [])
	}

	value { :self :p1 |
		apply(self, [p1])
	}

	value { :self :p1 :p2 |
		apply(self, [p1, p2])
	}

	value { :self :p1 :p2 :p3 |
		apply(self, [p1, p2, p3])
	}

	value { :self :p1 :p2 :p3 :p4 |
		apply(self, [p1, p2, p3, p4])
	}

	value { :self :p1 :p2 :p3 :p4 :p5 |
		apply(self, [p1, p2, p3, p4, p5])
	}

	whileFalse { :self :aProcedure |
		<primitive: while(!_self()) { _aProcedure(); }; return null;>
	}

	whileTrue { :self :aProcedure |
		<primitive: while(_self()) { _aProcedure(); }; return null;>
	}

}

+ Void {
	Procedure { 'Procedure()'.error }
}

+ Object {

	$ { :self :aProcedure:/1 |
		aProcedure(self)
	}

}
