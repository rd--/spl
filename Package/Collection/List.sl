List! : [Object, Json, Iterable, Indexable, Collection, Extensible, Removable, Sequenceable, PrimitiveSequence, Ordered] {

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

	fill { :shape :aBlock:/1 |
		shape.isEmpty.if {
			aBlock(0)
		} {
			let answer = shape.iota;
			shape.shapeIndicesDo { :index |
				answer.atPathPut(index, aBlock(index))
			};
			answer
		}
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

	join { :self :level |
		(level <= 1).if {
			self.catenate
		} {
			1.toAsCollect(self.first.size, self.first.species) { :index |
				self.collect { :row |
					row[index]
				}.join(level - 1)
			}
		}
	}

	normal { :self |
		self
	}

	printString { :self :toString:/1 |
		'[%]'.format([
			self.collect(toString:/1).commaSeparated
		])
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
		let removed = self[index];
		self.basicRemoveAt(index);
		removed
	}

	removeAtAll { :self :indices |
		let removed = self.atAll(indices);
		indices.do { :index |
			self.basicRemoveAt(index)
		};
		removed
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

	fill { :self :aBlock:/1 |
		let answer = List(self);
		answer.indicesDo { :index |
			answer[index] := aBlock(index)
		};
		answer
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

+@Number {

	linspace { :x1 :x2 :n |
		let step = (x2 - x1) / (n - 1);
		{ :x | x + step }.nestList(x1, n - 1)
	}

	logspace { :a :b :n |
		10 ^ a.linspace(b, n)
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

+@Sequenceable {

	asList { :self |
		let answer = List(self.size);
		self.indicesDo { :index |
			answer[index] := self[index]
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
		anInteger.isInteger.if {
			anInteger.fill(self.constant)
		} {
			self.error('@Object>>replicateInteger: not integer')
		}
	}

	replicateShape { :self :aSequence |
		aSequence.isEmpty.if {
			self.value
		} {
			aSequence.fill(self.constant)
		}
	}

}
