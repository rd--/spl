Array! : [Object, Json, Iterable, Indexable, Collection, Extensible, Removable, Sequenceable, Arrayed, Ordered] {

	adaptToNumberAndApply { :self :aNumber :aBlock:/2 |
		self.collect { :each |
			aBlock(aNumber, each)
		}
	}

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

	atAllPut { :self :anObject |
		<primitive:
		_self.fill(_anObject);
		return _anObject;
		>
	}

	intersperse { :self :anObject |
		| answer = []; |
		self.doSeparatedBy { :each |
			answer.add(each)
		} {
			answer.add(anObject)
		};
		answer
	}

	join { :self |
		self.joinSeparatedBy('')
	}

	joinCharacters { :self |
		self.collect(string:/1).joinSeparatedBy('')
	}

	joinSeparatedBy { :self :aString |
		self.collect(asString:/1).joinStringsSeparatedBy(aString)
	}

	joinStringsSeparatedBy { :self :aString |
		<primitive: return _self.join(_aString);>
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

	shallowCopy { :self |
		<primitive: return Array.from(_self);>
	}

	species { :self |
		Array:/1
	}

	storeString { :self |
		self.printString(storeString:/1)
	}

	unlines { :self |
		<primitive: return _self.join('\n');>
	}

	unwords { :self |
		self.joinSeparatedBy(' ')
	}

}

+SmallFloat {

	Array { :size |
		<primitive: return Array(_size);>
	}

	Array { :size :anObject |
		| answer = Array(size); |
		answer.atAllPut(anObject);
		answer
	}

	arithmeticSeries { :self :start :step |
		1.upTo(self).collect { :item |
			(step * (item - 1)) + start
		}
	}

	geometricSeries { :self :start :grow |
		| accum = start; |
		1.upTo(self).collect { :unusedItem |
			| entry = accum; |
			accum *:= grow;
			entry
		}
	}

	toAsCollect { :self :stop :species :aBlock:/1 |
		|(
			answerSize = stop - self + 1,
			answer = species.ofSize(answerSize)
		)|
		1.toDo(answerSize) { :index |
			answer[index] := aBlock(index + self - 1)
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

	Array { :self |
		| answer = Array(self.size), index = 0; |
		self.do { :each |
			index +:= 1;
			answer[index] := each
		};
		answer
	}

}

+@Sequenceable {

	Array { :self |
		| answer = Array(self.size); |
		self.indicesDo { :index |
			answer[index] := self[index]
		};
		answer
	}

}

+@Object {

	replicateApplying { :self :anInteger :aBlock:/1 |
		| answer = Array(anInteger); |
		answer.indicesDo { :index |
			answer[index] := aBlock(self)
		};
		answer
	}

	replicate { :self :anInteger |
		self.replicateApplying(anInteger, identity:/1)
	}

}

+@Integer {

	fibonacciArray { :self |
		self.fibonacciSequenceInto([])
	}

}
