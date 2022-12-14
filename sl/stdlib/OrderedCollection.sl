OrderedCollection : [Collection, SequenceableCollection] { | array |

	asArray { :self | self.array.copy }
	asCollection { :self | self }
	copy { :self | OrderedCollection(self.array.copy) }

	ofSize { :self :aNumber |
		(aNumber - self.size).timesRepeat { self.add(nil) };
		self
	}

	= { :self :anObject | anObject.isOrderedCollection & { self.array = anObject.array } }
	at { :self :index | self.array[index] }
	atPut { :self :index :anObject | self.array[index] := anObject }
	size { :self | self.array.size }

	add { :self :anObject | self.addLast(anObject) }
	addAllFirst { :self :aCollection | <primitive: return _self.array.unshift(..._asArray(_aCollection));> }
	addAllLast { :self :aCollection | <primitive: return _self.array.push(..._asArray(_aCollection));> }
	addFirst { :self :anObject | <primitive: return _self.array.unshift(_anObject);> }
	addLast { :self :anObject | <primitive: return _self.array.push(_anObject);> }
	collect { :self :aProcedure | OrderedCollection(self.array.collect(aProcedure)) }
	removeFirst { :self | <primitive: return _self.array.shift();> }
	removeLast { :self | <primitive: return _self.array.pop();> }

}

+ Void {

	OrderedCollection { OrderedCollection([]) }

}

+ Array {

	asOrderedCollection { :self | OrderedCollection(self) }

}

+ Number {

	fibonacciSequence { :self |
		| a = 0, b = 1, i = 0, temp = nil, answer = OrderedCollection(); |
		whileTrue { i < self } {
			answer.add(b);
			temp := b;
			b := a + b;
			a := temp;
			i := i + 1;
		};
		answer
	}

	fibonacciArray { :self | self.fibonacciSequence.asArray }

	OrderedCollection { :self |
		(* The array field is not a St array, it is a Js array. *)
		OrderedCollection()
	}

}

