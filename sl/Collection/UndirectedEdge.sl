UndirectedEdge : [Object] { | contents |

	asDot { :self |
		let [i, j] = self.contents;
		'% -- %;'.format([i, j])
	}

	asDirectedEdge { :self |
		let [i, j] = self.contents;
		DirectedEdge(i, j)
	}

	asEdge { :self |
		self
	}

	asList { :self |
		self.contents
	}

	asUndirectedEdge { :self |
		self
	}

	at { :self :index |
		self.contents[index]
	}

	hasCommonVertex { :self :anEdge |
		self.contents.includes(anEdge[1]) | {
			self.contents.includes(anEdge[2])
		}
	}

	isDirectedEdge { :self |
		false
	}

	isEdge { :self |
		true
	}

	matchesEdge { :self :edge |
		self.contents = edge.contents.sorted
	}

	printString { :self |
		let [i, j] = self.contents;
		'% --- %'.format([i, j])
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+List {

	asEdge { :self |
		let [i, j] = self;
		UndirectedEdge(i, j)
	}

	asEdgeList { :self |
		self.collect(asEdge:/1)
	}

}

+SmallFloat {

	--- { :self :anInteger |
		UndirectedEdge(self, anInteger)
	}

	UndirectedEdge { :self :anInteger |
		newUndirectedEdge().initializeSlots([self, anInteger].sorted)
	}

}
