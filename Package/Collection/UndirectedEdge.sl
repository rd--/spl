UndirectedEdge : [Object, Store, Equal, Compare, At, Indices] {

	| vertexList | <List>

	[DirectedEdge, undirectedEdgeToDirectedEdge] { :self |
		let [i, j] = self.vertexList;
		DirectedEdge(i, j)
	}

	[List, undirectedEdgeToList] { :self |
		self.vertexList
	}

	[UndirectedEdge, Edge, identity] { :self |
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
		[1L, 2L]
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
		'% --- %'.format([i.printString, j.printString])
	}

	rename { :self :aDictionary |
		let [i, j] = self.vertexList;
		aDictionary[i] --- aDictionary[j]
	}

	size { :unused |
		2L
	}

}

+List {

	Edge { :self |
		let [i, j] = self;
		UndirectedEdge(i, j)
	}

}

+[Integer, @SmallInteger] {

	[UndirectedEdge, ---] { :self Integer :anInteger Integer |
		uncheckedUndirectedEdge(
			[self, anInteger].sort!
		)
	}

}
