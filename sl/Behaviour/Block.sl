(* Requires: Object *)

Block! : [Object] {

	= { :self :anObject |
		self == anObject
	}

	apply { :self :anArray |
		<primitive:
		if(sl.isArray(_anArray) && (_self.length === _anArray.length)) {
			return _self(... _anArray);
		}
		>
		self.error('apply: argument is not array or not of required size')
	}

	assert { :self |
		self.assert(self);
		nil
	}

	cull { :self :firstArg |
		(self.numArgs >= 1).if {
			self.value(firstArg)
		} {
			self.value
		}
	}

	cull { :self :firstArg :secondArg |
		(self.numArgs >= 2).if {
			self.value(firstArg, secondArg)
		} {
			(self.numArgs = 1).if {
				self.value(firstArg)
			} {
				self.value
			}
		}
	}

	doWhileFalse { :self:/0 :conditionBlock:/0 |
		| answer |
		{
			answer := self();
			conditionBlock()
		}.whileFalse;
		answer
	}

	doWhileTrue { :self:/0 :conditionBlock:/0 |
		| answer |
		{
			answer := self();
			conditionBlock()
		}.whileTrue;
		answer
	}

	ensure { :self :aBlock:/0 |
		<primitive:
		var returnValue;
		try {
			returnValue = _self();
		} finally {
			_aBlock_0();
		};
		return returnValue;
		>
	}

	ifError { :self :errorHandlerBlock |
		<primitive:
		try {
			return _self();
		} catch (caughtValue) {
			if(caughtValue instanceof Error) {
				return _cull_2(_errorHandlerBlock, caughtValue)
			} {
				throw caughtValue;
			}
		}
		>
	}

	map { :self:/1 :aCollection |
		aCollection.collect(self:/1)
	}

	methodName { :self |
		<primitive: return _self.name.split(':')[0];>
	}

	millisecondsToRun { :self:/0 |
		system.millisecondsToRun(self:/0)
	}

	new { :self |
		self.cull(0)
	}

	new { :self :aNumber |
		self.cull(aNumber)
	}

	newFrom { :self:/1 :anObject |
		self(anObject)
	}

	numArgsIfAbsent { :self :ifAbsent:/0 |
		(*
			Js doesn't have a proper numArgs mechanism.
			In the simple arity model Spl adds hasRestParameters to the arity dispatch method functions, else it is undefined.
			From within Spl there is no concept of a variadic block.
		*)
		<primitive: return _self.hasRestParameters ? _ifAbsent() : _self.length;>
	}

	numArgsOrNil { :self |
		self.numArgsIfAbsent {
			nil
		}
	}

	numArgs { :self |
		self.numArgsIfAbsent {
			self.error('numArgs: applied to arity-dispatch block')
		}
	}

	name { :self |
		<primitive: return _self.name;>
	}

	ofSize { :self :aNumber |
		self.cull(aNumber).ofSize(aNumber)
	}

	repeat { :self:/0 |
		{
			self();
			true
		}.whileTrue
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

	valueWithArguments { :self :argumentsArray |
		<primitive: _self.apply(null, _argumentsArray)>
	}

	valueWithReturn { :self:/1 |
		<primitive:
		const returnBlock = function(returnValue) {
			throw returnValue;
		};
		try {
			return _self_1(returnBlock);
		} catch (returnedValue) {
			if(returnedValue instanceof Error) {
				throw returnedValue;
			} {
				return returnedValue;
			}
		}
		>
	}

	whileFalse { :self:/0 |
		{
			self()
		}.whileFalse {
		}
	}

	whileFalse { :self:/0 :aBlock:/0 |
		<primitive:
		while(!_self_0()) {
			_aBlock_0();
		};
		return null;
		>
	}

	whileTrue { :self:/0 |
		{
			self()
		}.whileTrue {
		}
	}

	whileTrue { :self:/0 :aBlock:/0 |
		<primitive:
		while(_self_0()) {
			_aBlock_0();
		};
		return null;
		>
	}

}
