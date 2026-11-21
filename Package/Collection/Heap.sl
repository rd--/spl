Heap : [Object, Copy, Equal, Do, At, Add, Remove] {

	| array sortFunction indexUpdateFunction | <List>

	add! { :self :anObject |
		self.array.add!(anObject);
		self.indexUpdate(anObject, self.size);
		self.upHeap(self.size);
		anObject
	}

	at { :self :index |
		self.atIfAbsent(index) {
			self.error('at: invalid index')
		}
	}

	atIfAbsent { :self :index :ifAbsent/0 |
		(index > self.size).if {
			ifAbsent()
		} {
			self.array.at(index)
		}
	}

	capacity { :self |
		self.size
	}

	compareItems { :self :anItem :anotherItem |
		let sortFunction/2 = self.sortFunction.ifNil {
			precedes/2
		};
		sortFunction(anItem, anotherItem)
	}

	do { :self :aFunction/1 |
		self.array.do(aFunction/1)
	}

	downHeap { :self :anIndex |
		let array = self.array;
		let size = array.size;
		let value = array[anIndex];
		let index = anIndex;
		let childIndex = nil;
		let childValue = nil;
		{
			(childIndex := (2L * index)) >= size | {
				childValue := array[childIndex];
				self.compareItems(array[childIndex + 1L], childValue).ifTrue {
					childIndex := childIndex + 1L;
					childValue := array[childIndex]
				};
				self.compareItems(value, childValue)
			}
		}.whileFalse {
			array[index] := childValue;
			self.indexUpdate(childValue, index);
			index := childIndex
		};
		(childIndex = size).ifTrue {
			childValue := array[childIndex];
			self.compareItems(value, childValue).ifFalse {
				array[index] := childValue;
				self.indexUpdate(childValue, index);
				index := childIndex
			}
		};
		array[index] := value;
		self.indexUpdate(value, index)
	}

	first { :self |
		self.array.at(1L)
	}

	indexUpdate { :self :anObject :anIndex |
		self.indexUpdateFunction.ifNotNil {
			let f/2 = self.indexUpdateFunction;
			f(anObject, anIndex)
		}
	}

	isEmpty { :self |
		self.size = 0L
	}

	isEqualBy { :self :anObject :aFunction/2 |
		self == anObject | {
			anObject.isHeap & {
				anObject.size = self.size & {
					anObject.sortFunction == self.sortFunction & {
						self.array.sort(self.sortFunction).isEqualBy(
							anObject.array.sort(self.sortFunction),
							aFunction/2
						)
					}
				}
			}
		}
	}

	isValid { :self |
		let array = self.array;
		let size = array.size;
		withReturn { :return/1 |
			1L.toDo(size // 2L) { :index |
				let childIndex = 2L * index;
				self.compareItems(array[index], array[childIndex]).ifFalse {
					false.return
				};
				(childIndex < size).ifTrue {
					childIndex := childIndex + 1L;
					self.compareItems(array[index], array[childIndex]).ifFalse {
						false.return
					}
				}
			};
			true
		}
	}

	postCopy { :self |
		self.array := self.array.copy
	}

	removeAll! { :self |
		self.array.removeAll!
	}

	removeAt! { :self :index |
		(index > self.size).if {
			self.errorInvalidIndex('removeAt!', index)
		} {
			self.uncheckedRemoveAt(index)
		}
	}

	removeFirst! { :self |
		self.removeAt!(1L)
	}

	removeIfAbsent! { :self :oldObject :aFunction/0 |
		let array = self.array;
		withReturn { :return/1 |
			1L.toDo(self.size) { :i |
				(array[i] = oldObject).ifTrue {
					self.uncheckedRemoveAt(i).return
				}
			};
			aFunction()
		}
	}

	size { :self |
		self.array.size
	}

	uncheckedRemoveAt { :self :index |
		let removed = self.array.at(index);
		(index = self.array.size).if {
			self.array.removeLast!
		} {
			self.array[index] := self.array.last;
			self.array.removeLast!;
			(2L * index <= self.size).if {
				self.downHeap(index)
			} {
				self.upHeap(index)
			}
		};
		removed
	}

	upHeap { :self :anIndex |
		(anIndex = 1L).if {
			self.indexUpdate(self.array[1L], 1L);
			self
		} {
			let index = nil;
			let parentValue = nil;
			let parentIndex = nil;
			let value = nil;
			value := self.array[index := anIndex];
			{
				index > 1L & {
					parentIndex := index.bitShiftRight(1L);
					parentValue := self.array[parentIndex];
					self.compareItems(value, parentValue)
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
		Heap([])
	}

}

+[List, Range] {

	Heap { :self :aFunction/2 |
		let answer = uncheckedHeap([], aFunction/2, nil);
		answer.addAll!(self);
		answer
	}

	Heap { :self |
		Heap(self, precedes/2)
	}

}
