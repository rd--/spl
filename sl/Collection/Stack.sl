{- Requires: LinkedList -}

Stack : [Object] { | linkedList |

	= { :self :aStack |
		aStack.isStack & {
			self.linkedList = aStack.linkedList
		}
	}

	errorEmptyStack { :self |
		self.error('Stack is empty')
	}

	isEmpty { :self |
		self.linkedList.isEmpty
	}

	notEmptyCheck { :self |
		self.isEmpty.ifTrue {
			self.errorEmptyStack
		}
	}

	peek { :self |
		self.notEmptyCheck;
		self.linkedList.first.value
	}

	pop { :self |
		self.notEmptyCheck;
		self.linkedList.removeFirst.value
	}

	postCopy { :self |
		self.linkedList := self.linkedList.copy
	}

	push { :self :anObject |
		self.linkedList.addFirst(anObject);
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
