{- Requires: Object -}

Block! : [Object] {

	= { :self :anObject |
		self == anObject
	}

	$ { :self:/1 :anObject |
		self(anObject)
	}

	@* { :self:/1 :aBlock:/1 |
		self:/1.composeLeft(aBlock:/1)
	}

	apply { :self :aList |
		<primitive:
		if(sl.isArray(_aList) && (_self.length === _aList.length)) {
			return _self(... _aList);
		}
		>
		self.error('apply: argument is not a list or not of required size')
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

	deepCopy { :self |
		'Block>>deepCopy: not implemented'.error
	}

	doWhileFalse { :self:/0 :conditionBlock:/0 |
		let answer = nil;
		{
			answer := self();
			conditionBlock()
		}.whileFalse;
		answer
	}

	doWhileTrue { :self:/0 :conditionBlock:/0 |
		let answer = nil;
		{
			answer := self();
			conditionBlock()
		}.whileTrue;
		answer
	}

	ensure { :self :aBlock:/0 |
		<primitive:
		let returnValue;
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

	isLiteral { :self |
		true
	}

	inner { :f:/2 :p :q :g:/2 |
		let h:/2 = f:/2.e;
		p.isVector.if {
			q.isVector.if {
				h(p, q).reduce(g:/2)
			} {
				q.isMatrix.if {
					q.transposed.collect { :each |
						h(p, each).reduce(g:/2)
					}
				} {
					'Block>>inner: q not vector or matrix'.error
				}
			}
		} {
			p.isMatrix.if {
				q.isVector.if {
					p.collect { :each |
						h(each, q).reduce(g:/2)
					}
				} {
					q.isMatrix.if {
						p.collect { :each |
							inner(f:/2, each, q, g:/2)
						}
					} {
						'Block>>inner: argument not vector or matrix'.error
					}
				}
			} {
				'Block>>inner: p not vector or matrix'.error
			}
		}
	}

	iterate { :self:/1 :anObject :anInteger |
		anInteger.timesRepeat {
			anObject := self(anObject)
		};
		anObject
	}

	map { :self:/1 :aCollection |
		aCollection.collect(self:/1)
	}

	map { :self:/2 :aSequence :anotherSequence |
		aSequence.withCollect(anotherSequence, self:/2)
	}

	methodName { :self |
		<primitive: return _self.name.split(':')[0];>
	}

	millisecondsToRun { :self:/0 |
		system.millisecondsToRun(self:/0)
	}

	name { :self |
		<primitive: return _self.name;>
	}

	new { :self |
		self.cull(0)
	}

	new { :self :aNumber |
		self.cull(aNumber)
	}

	newFrom { :self:/1 :aCollection |
		let answer = self(aCollection.size);
		answer.fillFrom(aCollection);
		answer
	}

	numArgsIfAbsent { :self :ifAbsent:/0 |
		{-
			Js does not have a proper numArgs mechanism.
			In the simple arity model Spl adds hasRestParameters to the arity dispatch method functions, else it is undefined.
			From within Spl there is no concept of a variadic block.
		-}
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

	ofSize { :self :aNumber |
		self.cull(aNumber).ofSize(aNumber)
	}

	outer { :self :aSequence :anotherSequence |
		(self.outer).value(aSequence, anotherSequence)
	}

	parameterNames { :self |
		<primitive: return _self.parameterNames;>
	}

	repeat { :self:/0 |
		{
			self();
			true
		}.whileTrue
	}

	table { :self:/2 |
		{ :aSequence :anotherSequence |
			self:/2.table(aSequence, anotherSequence)
		}
	}

	table { :self:/1 :aSequence |
		aSequence.collect(self:/1)
	}

	table { :self:/2 :aSequence :anotherSequence |
		aSequence.collect { :i |
			anotherSequence.collect { :j |
				self(i, j)
			}
		}
	}

	table { :self:/3 :aSequence :aSecondSequence :aThirdSequence |
		aSequence.collect { :i |
			aSecondSequence.collect { :j |
				aThirdSequence.collect { :k |
					self(i, j, k)
				}
			}
		}
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

	valueWithArguments { :self :argumentsList |
		<primitive: _self.apply(null, _argumentsList)>
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

	whileNil { :self:/0 :aBlock:/0 |
		let answer = nil;
		{
			(answer := self()).isNil
		}.whileTrue {
			aBlock()
		};
		answer
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

+@Object {

	also { :self :aBlock:/1 |
		aBlock(self);
		self
	}

	with { :self :aBlock:/1 |
		aBlock(self)
	}

}
