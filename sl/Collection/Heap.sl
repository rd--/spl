Heap : [Object, Iterable, Collection, Extensible, Removable] { | array sortBlock indexUpdateBlock |

	= { :self :anObject |
		(self == anObject) | {
			anObject.isHeap & {
				anObject.size = self.size & {
					anObject.sortBlock = self.sortBlock & {
						self.array.sort(self.sortBlock) = anObject.array.sort(self.sortBlock)
					}
				}
			}
		}
	}

	add { :self :anObject |
		self.array.add(anObject);
		self.indexUpdate(anObject, self.size);
		self.upHeap(self.size);
		anObject
	}

	at { :self :index |
		(index > self.size).if {
			self.errorInvalidIndex('at', index)
		} {
			self.array[index]
		}
	}

	atPut { :self :index :newObject |
		'Heap>>atPut: shouldNotImplement'.error
	}

	capacity { :self |
		self.size
	}

	collect { :self :aBlock:/1 |
		self.array.replace(aBlock:/1);
		self
	}

	compare { :self :anItem :anotherItem |
		self.sortBlock.ifNil {
			anItem <= anotherItem
		} {
			self.sortBlock.value(anItem, anotherItem)
		}
	}

	do { :self :aBlock:/1 |
		self.array.do(aBlock:/1)
	}

	downHeap { :self :anIndex |
		| childIndex childValue index value |
		index := anIndex;
		value := self.array[anIndex];
		{
			(childIndex := 2 * index) >= self.size | {
				childValue := self.array[childIndex];
				self.compare(self.array[childIndex + 1], childValue).ifTrue {
					childIndex +:= 1;
					childValue := self.array[childIndex]
				};
				self.compare(value, childValue)
			}
		}.whileFalse {
			self.array[index] := childValue;
			self.indexUpdate(childValue, index);
			index := childIndex
		};
		(childIndex = self.size).ifTrue {
			childValue := self.array[childIndex];
			self.compare(value, childValue).ifFalse {
				self.array[index] := childValue;
				self.indexUpdate(childValue, index);
				index := childIndex
			}
		};
		self.array[index] := value;
		self.indexUpdate(value, index)
	}

	downHeapSingle { :self :anIndex |
		self.downHeap(anIndex)
	}

	first { :self |
		self.array[1]
	}

	indexUpdate { :self :anObject :anIndex |
		self.indexUpdateBlock.ifNotNil {
			self.indexUpdateBlock.value(anObject, anIndex)
		}
	}

	isEmpty { :self |
		self.size = 0
	}

	postCopy { :self |
		self.array := self.array.copy
	}

	privateRemoveAt { :self :index |
		| removed = self.array.at(index); |
		(index = self.array.size).if {
			self.array.removeLast
		} {
			self.array[index] := self.array.last;
			self.array.removeLast;
			(2 * index <= self.size).if {
				self.downHeapSingle(index)
			} {
				self.upHeap(index)
			}
		};
		removed
	}

	removeIfAbsent { :self :oldObject :aBlock:/0 |
		valueWithReturn { :return:/1 |
			1.upToDo(self.size) { :i |
				(self.array[i] = oldObject).ifTrue {
					self.privateRemoveAt(i).return
				}
			};
			aBlock()
		}
	}

	removeAll { :self |
		self.array.removeAll
	}

	removeAt { :self :index |
		(index > self.size).if {
			self.errorInvalidIndex('removeAt', index)
		} {
			self.privateRemoveAt(index)
		}
	}

	removeFirst { :self |
		self.removeAt(1)
	}

	select { :self :aBlock:/1 |
		| newCollection = Heap(); |
		1.upToDo(self.size) { :index |
			| element = self.array[index]; |
			aBlock(element).ifTrue {
				newCollection.add(element)
			}
		};
		newCollection
	}

	size { :self |
		self.array.size
	}

	upHeap { :self :anIndex |
		(anIndex = 1).if {
			self.indexUpdate(self.array[1], 1);
			self
		} {
			| index parentValue parentIndex value |
			value := self.array[index := anIndex];
			{
				index > 1 & {
					parentIndex := index.bitShiftRight(1);
					parentValue := self.array[parentIndex];
					self.compare(value, parentValue)
				}
			}.whileTrue {
				self.array[index] := parentValue;
				self.indexUpdate(parentValue, index);
				index := parentIndex
			};
			self.array[index] := value;
			self.indexUpdate(value, index)
		}
	}

}

+Void {

	Heap {
		newHeap().initializeSlots([], nil, nil)
	}

}

+Block {

	Heap { :self:/2 |
		newHeap().initializeSlots([], self:/2, nil)
	}

}

+Array {

	asHeap { :self |
		newHeap().initializeSlots(self, nil, nil)
	}

}

+Interval {

	asHeap { :self |
		self.asArray.asHeap
	}

}
