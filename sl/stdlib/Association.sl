Association { | key value |

	= { :self :anAssociation | self.key = anAssociation.key }
	copy { :self | Association(self.key, self.value) }

	asArray { :self | [self.key, self.value] }
	printString { :self | 'Association(' ++ self.key.printString ++ ', ' ++ self.value.printString ++ ')' }

}

+ Object {

	-> { :self :anObject | Association(self, anObject) }

}
