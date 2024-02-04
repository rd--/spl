List! : [Object, Json, Iterable, Indexable, Collection, Extensible, Removable, Sequenceable, PrimitiveList, Ordered] {

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

	isMatrix { :self |
		self.allSatisfy { :each | each.isList & { each.isVector } }.and {
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

+SmallFloat {

	List { :size |
		<primitive: return Array(_size);>
	}

	List { :size :anObject |
		let answer = List(size);
		answer.atAllPut(anObject);
		answer
	}

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

+Block {

	! { :self :anInteger |
		self.duplicate(anInteger)
	}

	duplicate { :self |
		self.duplicate(2)
	}

	duplicate { :self :anInteger |
		self.replicateApplying(anInteger, value:/1)
	}

}

+List {

	!++ { :self :anInteger |
		(self ! anInteger).concatenation
	}

}

+@Object {

	replicateApplying { :self :anInteger :aBlock:/1 |
		let answer = List(anInteger);
		answer.indicesDo { :index |
			answer[index] := aBlock(self)
		};
		answer
	}

	replicate { :self :anInteger |
		self.replicateApplying(anInteger, identity:/1)
	}

	! { :self :anInteger |
		self.replicate(anInteger)
	}

}

+@Integer {

	fibonacciList { :self |
		self.fibonacciSequenceInto([])
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

+List {

	isMatrixOf { :self :elementType |
		self.elementType = 'List' & {
			self.allSatisfy { :each |
				each.elementType = elementType
			}
		}
	}

}

+List {

	plot { :self |
		let fileName = '/tmp/listPlot.json';
		fileName.writeTextFile([self].json).then { :unused |
			system.systemCommand(
				'hsc3-plot',
				[
					'json',
					'x',
					'--rows',
					fileName,
					0
				]
			)
		}
	}

}
