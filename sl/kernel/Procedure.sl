Procedure {

	= { :self :anObject |
		self == anObject
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

	ifError { :self :errorHandlerBlock |
		<primitive: try { return _self(); } catch (exc) { return _errorHandlerBlock(exc) }>
	}

	withReturn { :self |
		<primitive: try { return _self(); } catch (ret) { if(ret instanceof Error) { throw(ret); } { return ret; } }>
	}

	apply { :self :anArray |
		<primitive: if(sl.isArray(_anArray)) { return _self(... _anArray); }>
		error('Procedure>>apply')
	}

	while { :self :aProcedure |
		<primitive: while(_self()) { _aProcedure(); }; return null;>
	}

	whileFalse { :self :aProcedure |
		<primitive: while(!_self()) { _aProcedure(); }; return null;>
	}

	value { :self | apply(self, []) }
	value { :self :p1 | apply(self, [p1]) }
	value { :self :p1 :p2 | apply(self, [p1, p2]) }
	value { :self :p1 :p2 :p3 | apply(self, [p1, p2, p3]) }

	cull { :self :firstArg |
		if(self.numArgs >= 1) {
			self(firstArg)
		} {
			self()
		}
	}

	cullCull { :self :firstArg :secondArg |
		if(self.numArgs >= 2) {
			self.(firstArg, secondArg)
		} {
			if(self.numArgs = 1) {
				self(firstArg)
			} {
				self()
			}
		}
	}

}

+ Void {
	Procedure { 'Procedure()'.error }
}

+ Object {

	$ { :self :aProcedure |
		aProcedure(self)
	}

}
