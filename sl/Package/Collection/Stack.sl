Stack : [Object] { | linkedList |

	= { :self :aStack |
		aStack.isStack & {
			self.linkedList = aStack.linkedList
		}
	}

	errorEmptyStack { :self |
		'Stack: this stack is empty'.error
	}

	ifNotEmpty { :self :aBlock:/0 |
		self.isEmpty.if {
			self.errorEmptyStack
		} {
			aBlock()
		}
	}

	isEmpty { :self |
		self.linkedList.isEmpty
	}

	pop { :self |
		self.ifNotEmpty {
			self.linkedList.removeFirst.value
		}
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
		self.ifNotEmpty {
			self.linkedList.first.value
		}
	}

}

+Void {

	Stack {
		newStack().initializeSlots(LinkedList())
	}

}
