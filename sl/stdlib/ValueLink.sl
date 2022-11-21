ValueLink { | nextLink value |

	asLink { :self | self }

	= { :self :anObject |
		anotherObject.isValueLink & { self.value = anotherObject.value } & { self.nextLink == anotherObject.nextLink }
	}

}

+ Object {

	asLink { :self | ValueLink(nil, self) }

}
