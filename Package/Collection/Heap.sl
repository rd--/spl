Heap : [Object, Copyable, Equatable, Comparable, Iterable, Collection, Extensible, Removable] { | array sortBlock indexUpdateBlock |

	add { :self :anObject |
		self.array.add(anObject);
		self.indexUpdate(anObject, self.size);
		self.upHeap(self.size);
		anObject
	}

	atIfAbsent { :self :index :ifAbsent:/0 |
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

	atPut { :self :index :newObject |
		self.shouldNotImplement('atPut')
	}

	capacity { :self |
		self.size
	}

	collect { :self :aBlock:/1 |
		self.array.replace(aBlock:/1);
		self
	}

	compare { :self :anItem :anotherItem |
		let sortBlock:/2 = self.sortBlock;
		sortBlock:/2.ifNil {
			anItem <=| anotherItem
		} {
			sortBlock(anItem, anotherItem)
		}
	}

	do { :self :aBlock:/1 |
		self.array.do(aBlock:/1)
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
				self.compare(array[childIndex + 1], childValue).ifTrue {
					childIndex := childIndex + 1;
					childValue := array[childIndex]
				};
				self.compare(value, childValue)
			}
		}.whileFalse {
			array[index] := childValue;
			self.indexUpdate(childValue, index);
			index := childIndex
		};
		(childIndex = size).ifTrue {
			childValue := array[childIndex];
			self.compare(value, childValue).ifFalse {
				array[index] := childValue;
				self.indexUpdate(childValue, index);
				index := childIndex
			}
		};
		array[index] := value;
		self.indexUpdate(value, index)
	}

	equalBy { :self :anObject :aBlock:/2 |
		self == anObject | {
			anObject.isHeap & {
				anObject.size = self.size & {
					anObject.sortBlock = self.sortBlock & {
						self.array.sort(self.sortBlock).equalBy(anObject.array.sort(self.sortBlock), aBlock:/2)
					}
				}
			}
		}
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

	isValid { :self |
		let array = self.array;
		let size = array.size;
		valueWithReturn { :return:/1 |
			1.toDo(size // 2) { :index |
				let childIndex = 2 * index;
				self.compare(array[index], array[childIndex]).ifFalse {
					false.return
				};
				(childIndex < size).ifTrue {
					childIndex := childIndex + 1;
					self.compare(array[index], array[childIndex]).ifFalse {
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

	privateRemoveAt { :self :index |
		let removed = self.array.at(index);
		(index = self.array.size).if {
			self.array.removeLast
		} {
			self.array[index] := self.array.last;
			self.array.removeLast;
			(2 * index <= self.size).if {
				self.downHeap(index)
			} {
				self.upHeap(index)
			}
		};
		removed
	}

	removeIfAbsent { :self :oldObject :aBlock:/0 |
		valueWithReturn { :return:/1 |
			1.toDo(self.size) { :i |
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
		let newCollection = Heap();
		1.toDo(self.size) { :index |
			let element = self.array[index];
			aBlock(element).ifTrue {
				newCollection.add(element)
			}
		};
		newCollection
	}

	size { :self |
		self.array.size
	}

	/*
	sort { :self |
		let start = 1;
		let array = self.array;
		let end = array.size;
		let index = end;
		{ index > 1 }.whileTrue {
			let element = array[index];
			array[index] := array[1];
			array[1] := element;
			index := index - 1;
			self.downHeap(1); array.postLine
		};
		index := end;
		{ start < end }.whileTrue {
			let element = array[start];
			let endValue = array[end];
			array[start] := endValue;
			array[end] := element;
			self.indexUpdate(endValue, start);
			self.indexUpdate(element, end);
			start := start + 1;
			end := end - 1; [start, end, array].postLine
		};
		(start = end).ifTrue {
			self.indexUpdateBlock(array[start], start)
		};
		self
	}
	*/

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

+List {

	asHeap { :self |
		newHeap().initializeSlots(self, nil, nil)
	}

}

+Range {

	asHeap { :self |
		self.asList.asHeap
	}

}
