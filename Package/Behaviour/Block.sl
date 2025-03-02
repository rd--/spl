/* Requires: Object */

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

	argumentCount { :self |
		self.numArgs
	}

	argumentNames { :self |
		<primitive: return _self.argumentNames;>
	}

	array { :aBlock :shape |
		shape.size.caseOfOtherwise(
			[
				{ 1 } -> { aBlock.table((1 .. shape[1])) },
				{ 2 } -> { aBlock.table((1 .. shape[1]), (1 .. shape[2])) },
				{ 3 } -> { aBlock.table((1 .. shape[1]), (1 .. shape[2]), (1 .. shape[3])) }
			]
		) {
			aBlock.error('array: not vector or matrix or volume')
		}
	}

	arrayFilter { :aBlock:/1 :aList :anInteger |
		(1 .. aList.size).collect { :i |
			aBlock(aList.copyFromToPin(i - anInteger, i + anInteger))
		}
	}

	asBinaryBlock { :self |
		(self.numArgs = 2).if {
			self
		} {
			self.error('asBinaryBlock: not binary')
		}
	}

	asBlock { :self |
		self
	}

	asTernaryBlock { :self |
		(self.numArgs = 3).if {
			self
		} {
			self.error('asTernaryBlock: not ternary')
		}
	}

	asUnaryBlock { :self |
		(self.numArgs = 1).if {
			self
		} {
			self.error('asUnaryBlock: not unary')
		}
	}

	assert { :self |
		self.assert(self);
		nil
	}

	blockMap { :aBlock:/1 :aList :n :d |
		let answer = [];
		let index = 1;
		(1, 1 + d .. aList.size - n + 1).collect { :i |
			answer.add(aBlock(aList.copyFromTo(i, i + n - 1)))
		};
		answer
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

	elementwise { :self:/1 :x |
		x.isAtom {
			self(x)
		} {
			x.collect(self:/1)
		}
	}

	elementwise { :self:/2 :x :y |
		(x.isAtom & { y.isAtom }).if {
			self(x, y)
		} {
			x.nest.withCollect(y.nest) { :i :j |
				self:/2.elementwise(i, j)
			}
		}
	}

	elementwise { :self:/3 :x :y :z |
		(x.isAtom & { y.isAtom & { z.isAtom }}).if {
			self(x, y, z)
		} {
			x.nest.withWithCollect(y.nest, z.nest) { :i :j :k |
				self:/3.elementwise(i, j, k)
			}
		}
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

	eulerMethod { :self:/2 :y0 :x0 :x1 :h |
		let x = x0;
		let y = y0;
		let vx = [x0];
		let vy = [y0];
		{
			x < x1
		}.whileTrue {
			x := x + h;
			y := y + (h * self(x, y));
			vx.add(x);
			vy.add(y)
		};
		[vx, vy]
	}

	ifError { :self :errorHandlerBlock:/1 |
		<primitive:
		try {
			return _self();
		} catch (caughtValue) {
			if(caughtValue instanceof Error) {
				return _cull_2(_errorHandlerBlock_1, caughtValue)
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

	isImmediate { :self |
		true
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

	map { :self:/2 :aList :anotherList |
		aList.withCollect(anotherList, self:/2)
	}

	map { :self:/3 :aList :anotherList :aThirdList |
		aList.withWithCollect(anotherList, aThirdList, self:/3)
	}

	memoize { :self:/1 :requireImmediate |
		let table = requireImmediate.if { Map() } { Dictionary() };
		{ :input |
			table.atIfAbsent(input) {
				let answer = self(input);
				table.atPut(input, answer);
				answer
			}
		}
	}

	millisecondsToRun { :self:/0 |
		system.millisecondsToRun(self:/0)
	}

	movingMap { :self:/1 :sequence :windowSize |
		let answer = [];
		1.toDo(sequence.size - windowSize + 1) { :i |
			answer.add(
				self(sequence.copyFromTo(i, i + windowSize - 1))
			)
		};
		answer
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
		/*
		Js does not have a proper numArgs mechanism.
		In the simple arity model Spl adds hasRestParameters to the arity dispatch method functions, else it is undefined.
		From within Spl there is no concept of a variadic block.
		*/
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

	outer { :self :aList :anotherList |
		(self.outer).value(aList, anotherList)
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

	sourceCode { :self |
		<primitive: return _self.sourceCode;>
	}

	rungeKuttaMethod { :self:/2 :y0 :x0 :x1 :h |
		let f:/2 = self:/2;
		let x = x0;
		let y = y0;
		let vx = [x0];
		let vy = [y0];
		{
			x < x1
		}.whileTrue {
			let k1 = h * f(x, y);
			let k2 = h * f(x + (0.5 * h), y + (0.5 * k1));
			let k3 = h * f(x + (0.5 * h), y + (0.5 * k2));
			let k4 = h * f(x + h, y + k3);
			x := x + h;
			y := y + ((k1 + k2 + k2 + k3 + k3 + k4) / 6);
			vx.add(x);
			vy.add(y)
		};
		[vx, vy]
	}

	table { :self:/2 |
		{ :aList :anotherList |
			self:/2.table(aList, anotherList)
		}
	}

	table { :self:/1 :aList |
		aList.collect(self:/1)
	}

	table { :self:/2 :aList :anotherList |
		aList.collect { :i |
			anotherList.collect { :j |
				self(i, j)
			}
		}
	}

	table { :self:/3 :aList :aSecondList :aThirdList |
		aList.collect { :i |
			aSecondList.collect { :j |
				aThirdList.collect { :k |
					self(i, j, k)
				}
			}
		}
	}

	unqualifiedName { :self |
		<primitive: return _self.name.split(':')[0];>
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
