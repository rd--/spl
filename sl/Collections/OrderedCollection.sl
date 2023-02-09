OrderedCollection : [Object, Collection, SequenceableCollection] { | array | (* Note: a Js array, not an St array  *)

	= { :self :anObject |
		anObject.isOrderedCollection & {
			self.array = anObject.array
		}
	}

	add { :self :anObject |
		self.addLast(anObject)
	}

	addAllFirst { :self :aCollection |
		self.addArrayFirst(aCollection.Array)
	}

	addAllLast { :self :aCollection |
		self.addArrayLast(aCollection.Array)
	}

	addArrayFirst { :self :anArray |
		<primitive: return _self.array.unshift(..._anArray);>
	}

	addArrayLast { :self :anArray |
		<primitive: return _self.array.push(..._anArray);>
	}

	addFirst { :self :anObject |
		<primitive: return _self.array.unshift(_anObject);>
	}

	addLast { :self :anObject |
		<primitive: return _self.array.push(_anObject);>
	}

	asArray { :self |
		self.array.copy
	}

	asCollection { :self |
		self
	}

	at { :self :index |
		self.array[index]
	}

	atPut { :self :index :anObject |
		self.array[index] := anObject
	}

	collect { :self :aProcedure |
		OrderedCollection(self.array.collect(aProcedure))
	}

	copy { :self |
		OrderedCollection(self.array.copy)
	}

	ofSize { :self :aNumber |
		(aNumber - self.size).timesRepeat {
			self.add(nil)
		};
		self
	}

	size { :self |
		self.array.size
	}

	removeFirst { :self |
		<primitive: return _self.array.shift();>
	}

	removeLast { :self |
		<primitive: return _self.array.pop();>
	}

	species { :self |
		OrderedCollection:/1
	}

	Array { :self |
		self.array.copy
	}

	IdentitySet { :self |
		self.array.IdentitySet
	}

	OrderedCollection { :self |
		self
	}

}

+ Void {

	OrderedCollection {
		newOrderedCollection([])
	}

}

+ Array {

	OrderedCollection { :self |
		newOrderedCollection(self)
	}

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

	fibonacciArray { :self |
		self.fibonacciSequence.asArray
	}

	OrderedCollection { :self |
		OrderedCollection()
	}

}
