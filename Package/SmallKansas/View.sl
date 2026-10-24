@View {

	frameMenuItems { :self |
		[]
	}

	frameMutate! { :self :aFrame |
	}

	name { :self |
		self.title.replaceStringAll(' ', '')
	}

	outerElement { :self |
		self.typeResponsibility('@View>>outerElement')
	}

	title { :self |
		self.typeName
	}

}
