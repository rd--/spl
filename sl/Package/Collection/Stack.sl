Stack : [Object] { | linkedList |

	= { :self :aStack |
		aStack.isStack & {
			self.linkedList = aStack.linkedList
		}
	}

	errorEmptyStack { :self |
		self.error('this stack is empty')
	}

	isEmpty { :self |
		self.linkedList.isEmpty
	}

	notEmptyCheck { :self |
		self.isEmpty.ifTrue {
			self.errorEmptyStack
		}
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

	top { :self |
		self.notEmptyCheck;
		self.linkedList.first.value
	}

}

+Void {

	Stack {
		newStack().initializeSlots(LinkedList())
	}

}
