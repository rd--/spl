ValueLink : [Object] { | nextLink value |

	= { :self :anObject |
		anotherObject.isValueLink &
		{ self.value = anotherObject.value } &
		{ self.nextLink == anotherObject.nextLink }
	}

	asLink { :self |
		self
	}

}

+ @Object {

	asLink { :self |
		newValueLink().initialize(nil, self)
	}

}
