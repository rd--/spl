Procedure : [Object] {

	= { :self :anObject |
		self == anObject
	}

	apply { :self :anArray |
		<primitive:
		if(sl.isArray(_anArray) && (_self.length === _anArray.length)) {
			return _self(... _anArray);
		}>
		error('Procedure>>apply: argument is not array or array is not of required size')
	}

	cull { :self :firstArg |
		if(self.numArgs >= 1) {
			self.value(firstArg)
		} {
			self.value
		}
	}

	cull { :self :firstArg :secondArg |
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

	new { :self:/0 |
		self()
	}

	new { :self:/1 :aNumber |
		self(aNumber)
	}

	newFrom { :self:/1 :anObject |
		self(anObject)
	}

	numArgsIfAbsent { :self :ifAbsent:/0 |
		(*
			Js doesn't have a proper numArgs mechanism.
			In the simple arity model Spl adds hasRestParameters to the arity dispatch method functions, else it is undefined.
			From within Spl there is no concept of a variadic procedure.
		*)
		<primitive: return _self.hasRestParameters ? _ifAbsent() : _self.length;>
	}

	numArgsOrNil { :self |
		self.numArgsIfAbsent { nil }
	}

	numArgs { :self |
		self.numArgsIfAbsent { 'numArgs: applied to arity-dispatch procedure'.error }
	}

	name { :self |
		<primitive: return _self.name;>
	}

	withReturn { :self |
		<primitive: try { return _self(); } catch (ret) { if(ret instanceof Error) { throw(ret); } { return ret; } }>
	}

	value { :self:/0 |
		self()
	}

	value { :self:/1 :p1 |
		self(p1)
	}

	value { :self:/2 :p1 :p2 |
		self(p1, p2)
	}

	value { :self:/3 :p1 :p2 :p3 |
		self(p1, p2, p3)
	}

	value { :self:/4 :p1 :p2 :p3 :p4 |
		self(p1, p2, p3, p4)
	}

	value { :self:/5 :p1 :p2 :p3 :p4 :p5 |
		self(p1, p2, p3, p4, p5)
	}

	whileFalse { :self :aProcedure |
		<primitive: while(!_self()) { _aProcedure(); }; return null;>
	}

	whileTrue { :self :aProcedure |
		<primitive: while(_self()) { _aProcedure(); }; return null;>
	}

}
