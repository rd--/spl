List! : [Object, Json, Iterable, Indexable, Collection, Extensible, Removable, Sequence, PrimitiveSequence, Ordered] {

	addListFirst { :self :aList |
		<primitive:
		_self.unshift(..._aList);
		return _aList;
		>
	}

	addListLast { :self :aList |
		<primitive:
		_self.push(..._aList);
		return _aList;
		>
	}

	addFirst { :self :anObject |
		<primitive:
		_self.unshift(_anObject);
		return _anObject;
		>
	}

	addLast { :self :anObject |
		<primitive:
		_self.push(_anObject);
		return _anObject;
		>
	}

	asList { :self |
		self
	}

	atAllPut { :self :anObject |
		<primitive:
		_self.fill(_anObject);
		return _anObject;
		>
	}

	diagonalMatrix { :self |
		let k = self.size;
		let answer = k.zeroMatrix(k);
		1.toDo(k) { :each |
			answer[each][each] := self[each]
		};
		answer
	}

	isJson { :self |
		self.allSatisfy(isJson:/1)
	}

	isLiteral { :self |
		self.allSatisfy(isLiteral:/1)
	}

	isMatrix { :self |
		self.allSatisfy { :each | each.isList & { each.isVector } } & {
			self.collect(size:/1).asSet.size = 1
		}
	}

	isVector { :self |
		self.noneSatisfy(isList:/1)
	}

	printString { :self :toString:/1 |
		'[' ++ self.collect(toString:/1).joinSeparatedBy(', ') ++ ']'
	}

	printString { :self |
		self.printString(printString:/1)
	}

	reflectionMatrix { :self |
		self := self / self.norm;
		self.size.caseOfOtherwise([
			{ 2 } -> {
				let [a, b] = self;
				[
					[a.squared - b.squared, 2 * a * b],
					[2 * a * b, b.squared - a.squared]
				]
			},
			{ 3 } -> {
				let [a, b, c] = self;
				[
					[1 - (2 * a.squared), -2 * a * b, -2 * a * c],
					[-2 * a * b, 1 - (2 * b.squared), -2 * b * c],
					[-2 * a * c, -2 * b * c, 1 - (2 * c.squared)]
				]
			}
		]) {
			'List>>reflectionMatrix: not two or three list'.error
		}
	}

	removeAll { :self |
		<primitive: return _self.splice(0);>
	}

	removeAt { :self :index |
		<primitive: return _self.splice(_index - 1, 1)[0];>
	}

	removeFirst { :self |
		<primitive: return _self.shift();>
	}

	removeFirst { :self :count |
		<primitive: return _self.splice(0, _count);>
	}

	removeLast { :self |
		<primitive: return _self.pop();>
	}

	removeLast { :self :count |
		<primitive: return _self.splice(_self.length - _count, _count);>
	}

	scalingMatrix { :self |
		self.diagonalMatrix
	}

	shallowCopy { :self |
		<primitive: return Array.from(_self);>
	}

	species { :self |
		List:/1
	}

	storeString { :self |
		self.printString(storeString:/1)
	}

}

+@Integer {

	arithmeticSeries { :self :start :step |
		1.upTo(self).collect { :each |
			(step * (each - 1)) + start
		}
	}

	geometricSeries { :self :start :grow |
		let answer = [];
		let next = start;
		self.timesRepeat {
			answer.add(next);
			next := next * grow
		};
		answer
	}

	List { :size |
		<primitive: return Array(Number(_size));>
	}

	List { :size :anObject |
		let answer = List(size);
		answer.atAllPut(anObject);
		answer
	}

}

+Void {

	List {
		<primitive: return [];>
	}

}

+@Collection {

	asList { :self |
		let answer = List(self.size);
		let index = 0;
		self.do { :each |
			index := index + 1;
			answer[index] := each
		};
		answer
	}

}

+@Sequence {

	asList { :self |
		let answer = List(self.size);
		self.indicesDo { :index |
			answer[index] := self[index]
		};
		answer
	}

	fill { :shape :aBlock:/1 |
		let answer = shape.iota;
		shape.shapeIndicesDo { :index |
			answer.atPathPut(index, aBlock(index))
		};
		answer
	}

}

+Block {

	! { :self :anObject |
		self.duplicate(anObject)
	}

	! { :self |
		self ! 2
	}

	duplicate { :self |
		self.duplicate(2)
	}

	duplicateInteger { :self:/0 :anInteger |
		anInteger.fill { :unusedIndex |
			self()
		}
	}

	duplicateShape { :self:/0 :shape |
		shape.fill { :unusedIndex |
			self()
		}
	}

	duplicate { :self:/0 :anObject |
		anObject.isSequence.if {
			self:/0.duplicateShape(anObject)
		} {
			self:/0.duplicateInteger(anObject)
		}
	}

}

+List {

	!++ { :self :anInteger |
		(self ! anInteger).concatenation
	}

}

+@Object {

	enclose { :self |
		[self]
	}

	nest { :self |
		self.isList.if {
			self
		} {
			[self]
		}
	}

	replicateInteger { :self :anInteger |
		anInteger.fill(self.constant)
	}

	replicateShape { :self :aSequence |
		aSequence.fill(self.constant)
	}

	replicate { :self :anObject |
		anObject.isSequence.if {
			self.replicateShape(anObject)
		} {
			self.replicateInteger(anObject)
		}
	}

	# { :self :anObject |
		self.replicate(anObject)
	}

}

+@Integer {

	fibonacciList { :self |
		self.fibonacciSequenceInto([])
	}

	fill { :self :aBlock:/1 |
		let answer = List(self);
		answer.indicesDo { :index |
			answer[index] := aBlock(index)
		};
		answer
	}

	identityMatrix { :self |
		let answer = self.zeroMatrix(self);
		1:self.do { :each |
			answer[each][each] := 1
		};
		answer
	}

	zeroMatrix { :self :other |
		1:self.collect { :unused |
			List(other, 0)
		}
	}

}
