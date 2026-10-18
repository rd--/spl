Heap : [Object, Copy, Store, Equal, Do, At, Add, Remove] {

	| array sortBlock indexUpdateBlock |

	add! { :self :anObject |
		self.array.add!(anObject);
		self.indexUpdate(anObject, self.size);
		self.upHeap(self.size);
		anObject
	}

	atIfAbsent { :self :index :ifAbsent/0 |
		(index > self.size).if {
			ifAbsent()
		} {
			self.array.at(index)
		}
	}

	at { :self :index |
		self.atIfAbsent(index) {
			self.error('at: invalid index')
		}
	}

	capacity { :self |
		self.size
	}

	compareItems { :self :anItem :anotherItem |
		let sortBlock/2 = self.sortBlock.ifNil {
			precedesOrEqualTo/2
		};
		sortBlock(anItem, anotherItem)
	}

	do { :self :aBlock/1 |
		self.array.do(aBlock/1)
	}

	downHeap { :self :anIndex |
		let array = self.array;
		let size = array.size;
		let value = array[anIndex];
		let index = anIndex;
		let childIndex = nil;
		let childValue = nil;
		{
			(childIndex := (2 * index)) >= size | {
				childValue := array[childIndex];
				self.compareItems(array[childIndex + 1], childValue).ifTrue {
					childIndex := childIndex + 1;
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

	isEqualBy { :self :anObject :aBlock/2 |
		self == anObject | {
			anObject.isHeap & {
				anObject.size = self.size & {
					anObject.sortBlock = self.sortBlock & {
						self.array.sort(self.sortBlock).isEqualBy(
							anObject.array.sort(self.sortBlock),
							aBlock/2
						)
					}
				}
			}
		}
	}

	first { :self |
		self.array[1]
	}

	indexUpdate { :self :anObject :anIndex |
		let f/2 = self.indexUpdateBlock;
		self.indexUpdateBlock.ifNotNil {
			f(anObject, anIndex)
		}
	}

	isEmpty { :self |
		self.size = 0
	}

	isValid { :self |
		let array = self.array;
		let size = array.size;
		withReturn { :return/1 |
			1.toDo(size // 2) { :index |
				let childIndex = 2 * index;
				self.compareItems(array[index], array[childIndex]).ifFalse {
					false.return
				};
				(childIndex < size).ifTrue {
					childIndex := childIndex + 1;
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

	removeIfAbsent! { :self :oldObject :aBlock/0 |
		let array = self.array;
		withReturn { :return/1 |
			1.toDo(self.size) { :i |
				(array[i] = oldObject).ifTrue {
					self.uncheckedRemoveAt(i).return
				}
			};
			aBlock()
		}
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
		self.removeAt!(1)
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
			(2 * index <= self.size).if {
				self.downHeap(index)
			} {
				self.upHeap(index)
			}
		};
		removed
	}

	upHeap { :self :anIndex |
		(anIndex = 1).if {
			self.indexUpdate(self.array[1], 1);
			self
		} {
			let index = nil;
			let parentValue = nil;
			let parentIndex = nil;
			let value = nil;
			value := self.array[index := anIndex];
			{
				index > 1 & {
					parentIndex := index.bitShiftRight(1);
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
		newHeap().initializeSlots([], nil, nil)
	}

}

+Block {

	Heap { :self/2 |
		newHeap().initializeSlots([], self/2, nil)
	}

}

+List {

	Heap { :self |
		newHeap().initializeSlots(self, nil, nil)
	}

}

+Range {

	Heap { :self |
		self.List.Heap
	}

}
