/* Requires: Object */

Block! : [Object, Equal] {

	[apply, nullaryApply] { :self/0 |
		self()
	}

	[apply, unaryApply] { :self/1 :p1 |
		self(p1)
	}

	[apply, binaryApply] { :self/2 :p1 :p2 |
		self(p1, p2)
	}

	[apply, ternaryApply] { :self/3 :p1 :p2 :p3 |
		self(p1, p2, p3)
	}

	[apply, quaternaryApply] { :self/4 :p1 :p2 :p3 :p4 |
		self(p1, p2, p3, p4)
	}

	[apply, quinaryApply] { :self/5 :p1 :p2 :p3 :p4 :p5 |
		self(p1, p2, p3, p4, p5)
	}

	[apply, senaryApply] { :self/5 :p1 :p2 :p3 :p4 :p5 :p6 |
		self(p1, p2, p3, p4, p5, p6)
	}

	applyList { :self :aList |
		<primitive:
		if(sl.isArray(_aList) && (_self.length === _aList.length)) {
			return _self(... _aList);
		}
		>
		self.error('applyList: argument is not a list or not of required size')
	}

	[argumentCount, arity] { :self |
		<primitive: return _self.length;>
	}

	argumentNames { :self |
		<primitive: return _self.argumentNames;>
	}

	array { :aBlock :shape |
		shape.size.caseOf(
			[
				1 -> { aBlock.table(1.to(shape[1])) },
				2 -> { aBlock.table(1.to(shape[1]), 1.to(shape[2])) },
				3 -> { aBlock.table(1.to(shape[1]), 1.to(shape[2]), 1.to(shape[3])) }
			]
		) {
			aBlock.error('array: not vector or matrix or volume')
		}
	}

	arrayFilter { :aBlock/1 :aList :anInteger |
		1.to(aList.size).collect { :i |
			aBlock(aList.copyFromToPin(i - anInteger, i + anInteger))
		}
	}

	assert { :self |
		self.assert(self);
		nil
	}

	binaryBlock { :self |
		(self.argumentCount = 2).if {
			self
		} {
			self.error('binaryBlock: not binary')
		}
	}

	blockMap { :aBlock/1 :aList :n :d |
		let answer = [];
		let index = 1;
		1.toBy(aList.size - n + 1, d).collect { :i |
			answer.add!(aBlock(aList.copyFromTo(i, i + n - 1)))
		};
		answer
	}

	clip { :aBlock/1 :minMax :replaceWith |
		{ :x |
			aBlock(x).clip(minMax, replaceWith)
		}
	}

	clip { :aBlock/1 :minMax |
		{ :x |
			aBlock(x).clip(minMax)
		}
	}

	[composeLeft, compose] { :self/1 :aBlock/1 |
		{ :anObject |
			self(aBlock(anObject))
		}
	}

	composeRight { :self/1 :aBlock/1 |
		{ :anObject |
			aBlock(self(anObject))
		}
	}

	convergentSeries { :f/1 :i :j :k :epsilon :g/2 |
		let r = f(i);
		let u = Infinity;
		let c = j.min(100_000);
		{
			c > 0 & {
				u >= epsilon
			}
		}.whileTrue {
			let t = r;
			i := i + k;
			c := c - 1;
			r := g(r, f(i));
			u := (r - t).abs
		};
		(c = 0).ifTrue {
			u.warning('convergentSeries: did not converge', [i, j, k, r, u])
		};
		r
	}

	convergentSeries{ :f/1 :i |
		convergentSeries(f/1, i, 1000, 1, 1E-16, +)
	}

	cull { :self :firstArg |
		self.argumentCount.caseOf(
			[
				0 -> { self.nullaryApply },
				1 -> { self.unaryApply(firstArg) }
			]
		) {
			self.error('cull: k > 1')
		}
	}

	cull { :self :firstArg :secondArg |
		self.argumentCount.caseOf(
			[
				0 -> { self.nullaryApply },
				1 -> { self.unaryApply(firstArg) },
				2 -> { self.binaryApply(firstArg, secondArg) }
			]
		) {
			self.error('cull: k > 2')
		}
	}

	cull { :self :firstArg :secondArg :thirdArg |
		self.argumentCount.caseOf(
			[
				0 -> { self.nullaryApply },
				1 -> { self.unaryApply(firstArg) },
				2 -> { self.binaryApply(firstArg, secondArg) },
				3 -> { self.ternaryApply(firstArg, secondArg, thirdArg) }
			]
		) {
			self.error('cull: k > 3')
		}
	}

	cull { :self :firstArg :secondArg :thirdArg :fourthArg |
		self.argumentCount.caseOf(
			[
				0 -> { self.nullaryApply },
				1 -> { self.unaryApply(firstArg) },
				2 -> { self.binaryApply(firstArg, secondArg) },
				3 -> { self.ternaryApply(firstArg, secondArg, thirdArg) },
				4 -> { self.quaternaryApply(firstArg, secondArg, thirdArg, fourthArg) }
			]
		) {
			self.error('cull: k > 4')
		}
	}

	dirichletConvolve { :f/1 :g/1 |
		{ :n |
			n.divisorSum { :d |
				f(d) * g(n / d)
			}
		}
	}

	dirichletInverse { :f/1 |
		let i/1 = { :n |
			(n = 1).if {
				1 / f(1)
			} {
				-1 / f(1) * n.divisors.allButLast.sum { :d |
					f(n / d) * i(d)
				}
			}
		}.memoize;
		i/1
	}

	doWhileFalse { :self/0 :conditionBlock/0 |
		let answer = nil;
		{
			answer := self();
			conditionBlock()
		}.whileFalse;
		answer
	}

	doWhileTrue { :self/0 :conditionBlock/0 |
		let answer = nil;
		{
			answer := self();
			conditionBlock()
		}.whileTrue;
		answer
	}


	[duplicate, !] { :self/0 :shape |
		{ :unused |
			self()
		}.fill(shape.nest)
	}

	elementwise { :self/1 :x |
		x.isAtom {
			self(x)
		} {
			x.collect(self/1)
		}
	}

	elementwise { :self/2 :x :y |
		(x.isAtom & { y.isAtom }).if {
			self(x, y)
		} {
			x.nest.withCollect(y.nest) { :i :j |
				self/2.elementwise(i, j)
			}
		}
	}

	elementwise { :self/3 :x :y :z |
		(x.isAtom & { y.isAtom & { z.isAtom }}).if {
			self(x, y, z)
		} {
			x.nest.withWithCollect(y.nest, z.nest) { :i :j :k |
				self/3.elementwise(i, j, k)
			}
		}
	}

	ensure { :self :aBlock/0 |
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

	fill { :aBlock/1 :shape |
		shape.isEmpty.if {
			aBlock(0)
		} {
			let answer = shape.constantArray(nil);
			shape.shapeIndicesDo { :index |
				answer.atPathPut!(index, aBlock(index))
			};
			answer
		}
	}

	foldList { :f/2 :y :x |
		x.foldList(y, f/2)
	}

	foldList { :f/2 :x |
		x.allButFirst.foldList(x[1], f/2)
	}

	foldPairList { :f/2 :y :xList :g/1 |
		let a = [];
		xList.do { :x |
			let r = f(y, x);
			a.add!(g(r));
			y := r[2]
		};
		a
	}

	foldPairList { :f/2 :y :xList |
		f/2.foldPairList(y, xList, first/1)
	}

	foldPairList { :f/2 :xList |
		f/2.foldPairList(xList[1], xList.allButFirst)
	}

	hasError { :self/0 |
		let answer = false;
		self/0.ifError { :unusedError |
			answer := true
		};
		answer
	}

	ifError { :self/0 :errorHandlerBlock/1 |
		<primitive:
		try {
			return _self_0();
		} catch (caughtValue) {
			if(caughtValue instanceof Error) {
				return _errorHandlerBlock_1(caughtValue)
			} {
				throw caughtValue;
			}
		}
		>
	}

	ignoreError { :self/0 |
		self/0.ifError { :unusedError |
			nil
		}
	}

	isLiteral { :unused |
		true
	}

	inner { :f/2 :p :q :g/2 |
		let h/2 = f/2.e;
		p.isVector.if {
			q.isVector.if {
				h(p, q).reduce(g/2)
			} {
				q.isMatrix.if {
					q.transpose.collect { :each |
						h(p, each).reduce(g/2)
					}
				} {
					'Block>>inner: q not vector or matrix'.error
				}
			}
		} {
			p.isMatrix.if {
				q.isVector.if {
					p.collect { :each |
						h(each, q).reduce(g/2)
					}
				} {
					q.isMatrix.if {
						p.collect { :each |
							inner(f/2, each, q, g/2)
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

	[isEqual, =] { :self :anObject |
		self.shouldNotImplement('equal')
	}

	isImmediate { :unused |
		true
	}

	[isSimilar, ~] { :self :anObject |
		self == anObject
	}

	iterate { :self/1 :anObject :anInteger |
		anInteger.timesRepeat {
			anObject := self(anObject)
		};
		anObject
	}

	keyMap { :self/1 :operand |
		let answer = operand.new;
		operand.keysAndValuesDo { :key :value |
			answer.include!(self(key) -> value)
		};
		answer
	}

	map { :self/1 :aCollection |
		aCollection.collect(self/1)
	}

	[map, zipWith] { :self/2 :aList :anotherList |
		aList.withCollect(anotherList, self/2)
	}

	map { :self/3 :aList :anotherList :aThirdList |
		aList.withWithCollect(anotherList, aThirdList, self/3)
	}

	mapApply { :self :aCollection |
		aCollection.collect { :each |
			self.applyList(each)
		}
	}

	mapIndexed { :self/2 :operand |
		operand.withIndexCollect(self/2)
	}

	mapThread { :self :aMatrix |
		aMatrix.transpose.collect { :aList |
			self.applyList(aList)
		}
	}

	memoizeBinary { :self/2 :requireImmediate |
		let f/1 = { :x |
			{ :y |
				self(x, y)
			}.memoizeUnary(requireImmediate)
		}.memoizeUnary(requireImmediate);
		{ :a :b |
			f(a).unaryApply(b)
		}
	}

	memoizeNilary { :self/0 |
		let cachedValue = nil;
		{
			cachedValue.ifNil {
				cachedValue := self()
			}
		}
	}

	memoizeUnary { :self/1 :requireImmediate |
		let table = requireImmediate.if {
			Map()
		} {
			Dictionary()
		};
		{ :input |
			table.atIfAbsent(input) {
				let answer = self(input);
				table.put!(input, answer);
				answer
			}
		}
	}

	memoize { :self :requireImmediate |
		self.argumentCount.caseOf(
			[
				0 -> {
					self.memoizeNilary
				},
				1 -> {
					self.memoizeUnary(requireImmediate)
				},
				2 -> {
					self.memoizeBinary(requireImmediate)
				}
			]
		)
	}

	memoize { :self |
		self.memoize(false)
	}

	movingMap { :self/1 :sequence :windowSize |
		let answer = [];
		1.toDo(sequence.size - windowSize + 1) { :i |
			answer.add!(
				self(sequence.copyFromTo(i, i + windowSize - 1))
			)
		};
		answer
	}

	name { :self |
		<primitive: return _self.name;>
	}

	neighbourhoodMap { :aBlock/2 :x :r |
		let n = x.size;
		1.to(n).collect { :i |
			let j = (i - r).max(1);
			let k = (i + r).min(n);
			aBlock(x.copyFromTo(j, k), i)
		}
	}

	nestWhile { :self/1 :anObject :aBlock/1 |
		{
			aBlock(anObject)
		}.whileTrue {
			anObject := self(anObject)
		};
		anObject
	}

	outer { :self :aList :anotherList |
		(self.outer).binaryApply(aList, anotherList)
	}

	parameterNames { :self |
		<primitive: return _self.parameterNames;>
	}

	pointwise { :f/2 :p/1 :q/1 |
		{ :x |
			f(p(x), q(x))
		}
	}

	repeatForever { :self/0 |
		{
			self();
			true
		}.whileTrue
	}

	repeatForeverWithBreak { :self/1 |
		withReturn { :return/1 |
			let break = { return(nil) };
			{
				self(break/0)
			}.repeatForever
		}
	}

	sortBlockToTypeCheckedCompareBlock { :sortBlock/2 |
		<primitive:
		return function(p, q) {
			const c = _sortBlock_2(p, q);
			if (typeof c === 'boolean') {
				return c ? -1 : 1;
			} {
				throw new Error('Non-boolean sort block');
			}
		};
		>
	}

	sourceCode { :self |
		<primitive: return _self.sourceCode;>
	}

	table { :self/2 |
		{ :aList :anotherList |
			self/2.table(aList, anotherList)
		}
	}

	table { :self/1 :aList |
		aList.collect(self/1)
	}

	table { :self/2 :aList :anotherList |
		aList.collect { :i |
			anotherList.collect { :j |
				self(i, j)
			}
		}
	}

	table { :self/3 :aList :aSecondList :aThirdList |
		aList.collect { :i |
			aSecondList.collect { :j |
				aThirdList.collect { :k |
					self(i, j, k)
				}
			}
		}
	}

	ternaryBlock { :self |
		(self.argumentCount = 3).if {
			self
		} {
			self.error('ternaryBlock: not ternary')
		}
	}

	typeCheckedCompareBlock { :compareBlock/2 |
		<primitive:
		return function(p, q) {
			const c = _compareBlock_2(p, q);
			if (c === -1 || c === 0 || c === 1) {
				return c;
			} {
				throw new Error('Non-ternary compare block');
			}
		};
		>
	}

	unaryBlock { :self |
		(self.argumentCount = 1).if {
			self
		} {
			self.error('unaryBlock: not unary')
		}
	}

	uncheckedApplyList { :self :argumentsList |
		<primitive: return _self.apply(null, _argumentsList);>
	}

	unqualifiedName { :self |
		<primitive: return _self.name.split('/')[0];>
	}

	withReturn { :self/1 |
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

	whileFalse { :self/0 |
		{
			self()
		}.whileFalse {
		}
	}

	whileFalse { :self/0 :aBlock/0 |
		<primitive:
		while(!_self_0()) {
			_aBlock_0();
		};
		>
		nil
	}

	whileNil { :self/0 :aBlock/0 |
		{
			self().isNil
		}.whileTrue {
			aBlock()
		}
	}

	whileTrue { :self/0 |
		{
			self()
		}.whileTrue {
			nil
		}
	}

	whileTrue { :self/0 :aBlock/0 |
		<primitive:
		while(_self_0()) {
			_aBlock_0();
		};
		>
		nil
	}

	yCombinator { :self/1 |
		let u = { :f/1 |
			{ :x/1 |
				f(x(x/1))
			}
		};
		let delta/1 = identity/1.u;
		{ :i/1 |
			self(
				{ :x |
					let h/1 = i(i/1);
					h(x)
				}
			)
		}.delta
	}

}

+@Object {

	also { :self :aBlock/1 |
		aBlock(self);
		self
	}

	[in, with] { :self :aBlock/1 |
		aBlock(self)
	}

}

+List {

	comap { :self |
		{ :operand |
			self.collect { :aBlock/1 |
				aBlock(operand)
			}
		}
	}

	comap { :self :operand |
		self.collect { :aBlock/1 |
			aBlock(operand)
		}
	}

	composeLeft { :self |
		self.reduce(composeLeft/2)
	}

	composeRight { :self |
		self.reduce(composeRight/2)
	}

}

+Block {

	predicateAnd { :self/1 :operand/1 |
		{ :anObject |
			self(anObject) & {
				operand(anObject)
			}
		}
	}

	predicateNot { :self/1 |
		{ :anObject |
			self(anObject).not
		}
	}

	predicateOr { :self/1 :operand/1 |
		{ :anObject |
			self(anObject) | {
				operand(anObject)
			}
		}
	}

}

+List{

	predicateAnd { :self |
		{ :anObject |
			self.allSatisfy { :aBlock/1 |
				aBlock(anObject)
			}
		}
	}

	predicateOr { :self |
		{ :anObject |
			self.anySatisfy { :aBlock/1 |
				aBlock(anObject)
			}
		}
	}

}

+Block {

	derivative { :f/1 :n |
		(n = 0).if {
			f/1
		} {
			f/1.name.caseOf(
				[
					'cos/1' -> { n.cosDerivative },
					'exp/1' -> { exp/1 },
					'log/1' -> {
						(n = 1).if {
							reciprocal/1
						} {
							'log'.error('not implemented')
						}
					},
					'sin/1' -> { n.sinDerivative }
				]
			)
		}
	}

	derivative { :self |
		self.derivative(1)
	}

}
