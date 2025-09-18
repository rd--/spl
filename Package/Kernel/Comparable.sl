@Comparable {

	<| { :self :anObject |
		self.compare(anObject) = -1
	}

	<=| { :self :anObject |
		self.compare(anObject) != 1
	}

	|> { :self :anObject |
		self.compare(anObject) = 1
	}

	|>= { :self :anObject |
		self.compare(anObject) != -1
	}

	precedes { :self :anObject |
		self.compare(anObject) = -1
	}

	precedesOrEqualTo { :self :anObject |
		self.compare(anObject) != 1
	}

	succeeds { :self :anObject |
		self.compare(anObject) = 1
	}

	succeedsOrEqualTo { :self :anObject |
		self.compare(anObject) != -1
	}

	compare { :self :anObject |
		self.typeResponsibility('@Comparable>>compare')
	}

}
