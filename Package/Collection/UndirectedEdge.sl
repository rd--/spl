UndirectedEdge : [Object, Store, Equal, Compare, At, Indices] {

	| vertexList |

	DirectedEdge { :self |
		let [i, j] = self.vertexList;
		DirectedEdge(i, j)
	}

	[UndirectedEdge, Edge] { :self |
		self
	}

	at { :self :index |
		self.vertexList.at(index)
	}

	compare { :self :anEdge |
		compareOn(self, anEdge, vertexList/1)
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
		let [i, j] = anEdge.vertexList;
		self.vertexList.includes(i) | {
			self.vertexList.includes(j)
		}
	}

	includes { :self :vertex |
		self.vertexList.includes(vertex)
	}

	indices { :unused |
		[1, 2]
	}

	isDirected { :unused |
		false
	}

	isEdge { :unused |
		true
	}

	isSelfLoop { :self |
		let [i, j] = self.vertexList;
		i = j
	}

	isUndirected { :unused |
		true
	}

	matchesEdge { :self :edge |
		self.vertexList = edge.vertexList.sort
	}

	printString { :self |
		let [i, j] = self.vertexList;
		'% --- %'.format([i, j])
	}

	rename { :self :aDictionary |
		let [i, j] = self.vertexList;
		aDictionary[i] --- aDictionary[j]
	}

	size { :unused |
		2
	}

}

+List {

	Edge { :self |
		let [i, j] = self;
		UndirectedEdge(i, j)
	}

}

+SmallFloat {

	[UndirectedEdge, ---] { :self :anInteger |
		newUndirectedEdge().initializeSlots(
			[self, anInteger].sort!
		)
	}

}
