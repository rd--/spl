@View {

	frame { :self :aFrame |
	}

	frameMenuItems { :self |
		[]
	}

	name { :self |
		self.title.replaceStringAll(' ', '')
	}

	outerElement { :self |
		self.typeResponsibility('@View>>outerElement')
	}

	title { :self |
		self.typeOf
	}

}
