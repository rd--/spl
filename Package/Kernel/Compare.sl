@Compare {

	compare { :self :anObject |
		self.typeResponsibility('@Compare>>compare')
	}

	[precedes, <|] { :self :anObject |
		self.compare(anObject) = -1
	}

	[precedesOrEqualTo, <=|] { :self :anObject |
		self.compare(anObject) != 1
	}

	[succeeds, |>] { :self :anObject |
		self.compare(anObject) = 1
	}

	[succeedsOrEqualTo, |>=] { :self :anObject |
		self.compare(anObject) != -1
	}

}
