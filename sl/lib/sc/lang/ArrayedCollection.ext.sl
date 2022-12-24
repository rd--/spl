+ @ArrayedCollection {

	rank { :self |
		1 + self.first.rank
	}

	shape { :self |
		[self.size] ++ self.first.shape
	}

}

+ Object {

	rank { :self |
		0
	}

	shape { :self |
		[]
	}

}
