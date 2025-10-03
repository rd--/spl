UndirectedEdge : [Object, Equatable, Comparable, Indexable] { | vertexList |

	asDirectedEdge { :self |
		let [i, j] = self.vertexList;
		DirectedEdge(i, j)
	}

	asEdge { :self |
		self
	}

	asList { :self |
		self.vertexList
	}

	asUndirectedEdge { :self |
		self
	}

	at { :self :index |
		self.vertexList.at(index)
	}

	compare { :self :anEdge |
		self.vertexList.compare(anEdge.vertexList)
	}

	forDot { :self :isMixed |
		let [i, j] = self.vertexList;
		isMixed.if {
			'% -> % [dir=none];'.format([i, j])
		} {
			'% -- %;'.format([i, j])
		}
	}

	hasCommonVertex { :self :anEdge |
		self.vertexList.includes(anEdge[1]) | {
			self.vertexList.includes(anEdge[2])
		}
	}

	includes { :self :vertex |
		self.vertexList.includes(vertex)
	}

	indices { :self |
		[1 2]
	}

	isDirected { :self |
		false
	}

	isEdge { :self |
		true
	}

	isUndirected { :self |
		true
	}

	matchesEdge { :self :edge |
		self.vertexList = edge.vertexList.sorted
	}

	printString { :self |
		let [i, j] = self.vertexList;
		'% --- %'.format([i, j])
	}

	rename { :self :aDictionary |
		aDictionary[self[1]] --- aDictionary[self[2]]
	}

	size { :self |
		2
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
