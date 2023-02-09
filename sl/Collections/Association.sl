Association : [Object] { | key value |

	= { :self :anAssociation |
		self.key = anAssociation.key
	}

	asArray { :self |
		[self.key, self.value]
	}

	copy { :self |
		Association(self.key, self.value)
	}

	printString { :self |
		'Association(' ++ self.key.printString ++ ', ' ++ self.value.printString ++ ')'
	}

}

+ @Object {

	-> { :self :anObject |
		Association(self, anObject)
	}

	Association { :self :anObject |
		newAssociation().initialize(self, anObject)
	}

}
