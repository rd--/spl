/* Requires: LinkedList */

Stack : [Object, Copy, Store, Equal] {

	| linkedList |

	errorEmptyStack { :self |
		self.error('Stack is empty')
	}

	isEmpty { :self |
		self.linkedList.isEmpty
	}

	isEqualBy { :self :aStack :aBlock/2 |
		aStack.isStack & {
			aBlock(self.linkedList, aStack.linkedList)
		}
	}

	isNotEmptyCheck { :self |
		self.isEmpty.ifTrue {
			self.errorEmptyStack
		}
	}

	peek { :self |
		let list = self.linkedList;
		list.isEmpty.if {
			nil
		} {
			list.first
		}
	}

	pop! { :self |
		let list = self.linkedList;
		list.isEmpty.if {
			nil
		} {
			list.removeFirst!
		}
	}

	postCopy { :self |
		self.linkedList := self.linkedList.copy
	}

	push! { :self :anObject |
		self.linkedList.addFirst!(anObject);
		anObject
	}

	size { :self |
		self.linkedList.size
	}

}

+Void {

	Stack {
		newStack().initializeSlots(LinkedList())
	}

}
