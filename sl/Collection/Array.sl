Array! : [Object, Json, Iterable, Indexable, Collection, Extensible, Removable, Sequenceable, Arrayed, Ordered] {

	addArrayFirst { :self :anArray |
		<primitive:
		_self.unshift(..._anArray);
		return _anArray;
		>
	}

	addArrayLast { :self :anArray |
		<primitive:
		_self.push(..._anArray);
		return _anArray;
		>
	}

	addFirst { :self :anObject |
		<primitive:
		_self.unshift(_anObject);
		return _anObject;
		>
	}

	addLast { :self :anObject |
		<primitive: return _self.push(_anObject);>
	}

	asArray { :self |
		self
	}

	atAllPut { :self :anObject |
		<primitive:
		_self.fill(_anObject);
		return _anObject;
		>
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
		Array:/1
	}

	storeString { :self |
		self.printString(storeString:/1)
	}

}

+SmallFloat {

	Array { :size |
		<primitive: return Array(_size);>
	}

	Array { :size :anObject |
		let answer = Array(size);
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

	Array {
		<primitive: return [];>
	}

}

+@Collection {

	asArray { :self |
		let answer = Array(self.size);
		let index = 0;
		self.do { :each |
			index := index + 1;
			answer[index] := each
		};
		answer
	}

}

+@Sequenceable {

	asArray { :self |
		let answer = Array(self.size);
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

+Array {

	!++ { :self :anInteger |
		(self ! anInteger).concatenation
	}

}

+@Object {

	replicateApplying { :self :anInteger :aBlock:/1 |
		let answer = Array(anInteger);
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

	fibonacciArray { :self |
		self.fibonacciSequenceInto([])
	}

}

+Array {

	isMatrixOf { :self :elementType |
		self.elementType = 'Array' & {
			self.allSatisfy { :each |
				each.elementType = elementType
			}
		}
	}

}

+Array {

	plot { :self |
		let fileName = '/tmp/arrayPlot.json';
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
