OrderedCollection : [Object, Collection, SequenceableCollection] { | primitiveArray | (* i.e. a Js array, not an Spl array  *)

	= { :self :anObject |
		anObject.isOrderedCollection & {
			self.primitiveArray = anObject.primitiveArray
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
		<primitive: return _self.primitiveArray.unshift(..._anArray);>
	}

	addArrayLast { :self :anArray |
		<primitive: return _self.primitiveArray.push(..._anArray);>
	}

	addFirst { :self :anObject |
		<primitive: return _self.primitiveArray.unshift(_anObject);>
	}

	addLast { :self :anObject |
		<primitive: return _self.primitiveArray.push(_anObject);>
	}

	asArray { :self |
		self.primitiveArray.copy
	}

	at { :self :index |
		self.primitiveArray[index]
	}

	atPut { :self :index :anObject |
		self.primitiveArray[index] := anObject
	}

	collect { :self :aProcedure |
		OrderedCollection(self.primitiveArray.collect(aProcedure))
	}

	copy { :self |
		OrderedCollection(self.primitiveArray.copy)
	}

	ofSize { :self :aNumber |
		(aNumber - self.size).timesRepeat {
			self.add(nil)
		};
		self
	}

	size { :self |
		self.primitiveArray.size
	}

	removeFirst { :self |
		<primitive: return _self.primitiveArray.shift();>
	}

	removeLast { :self |
		<primitive: return _self.primitiveArray.pop();>
	}

	species { :self |
		OrderedCollection:/1
	}

	Array { :self |
		self.primitiveArray.copy
	}

	IdentitySet { :self |
		self.primitiveArray.IdentitySet
	}

	OrderedCollection { :self |
		self
	}

}

+ Void {

	OrderedCollection {
		[].OrderedCollection
	}

}

+ Array {

	OrderedCollection { :self |
		newOrderedCollection().initializeSlots(self)
	}

}

+ Number {

	fibonacciSequence { :self |
		| a = 0, b = 1, i = 0, temp = nil, answer = OrderedCollection(); |
		{ i < self }.whileTrue {
			answer.add(b);
			temp := b;
			b := a + b;
			a := temp;
			i := i + 1
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
