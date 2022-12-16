+ Object {

	! { :self :anInteger |
		self.dup(anInteger)
	}

	!+ { :self :anInteger |
		(self ! anInteger).sum
	}

	!* { :self :anInteger |
		(self ! anInteger).product
	}

	dup { :self :anInteger |
		self.replicateApplying(anInteger, value)
	}

}
