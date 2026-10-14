Box : [Object, Store, Equal] {

	| unbox |

}

+@Object {

	Box { :self |
		newBox().initializeSlots(self)
	}

}
