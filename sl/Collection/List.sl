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

	antidiagonalMatrix { :self |
		let k = self.size;
		let answer = k.zeroMatrix(k);
		1.toDo(k) { :each |
			answer[k - each + 1][each] := self[each]
		};
		answer
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

	isAssociationList { :self |
		self.allSatisfy(isAssociation:/1)
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
		'[' ++ self.collect(toString:/1).stringJoin(', ') ++ ']'
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
		1.to(self).collect { :each |
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
		<primitive: return Array(Number(_size)).fill(null);>
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

+@Object {

	! { :self :anObject |
		self.duplicateInteger(anObject)
	}

	# { :self :anObject |
		self.replicateInteger(anObject)
	}

	duplicateInteger { :self :anInteger |
		anInteger.fill { :unusedIndex |
			self.value
		}
	}

	duplicateShape { :self :shape |
		shape.fill { :unusedIndex |
			self.value
		}
	}

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

}

+@Integer {

	exchangeMatrix { :self |
		let answer = self.zeroMatrix(self);
		1:self.do { :each |
			answer[self - each + 1][each] := 1
		};
		answer
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
