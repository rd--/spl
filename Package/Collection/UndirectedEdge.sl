UndirectedEdge : [Object, Store, Equal, Compare, Indexable] {

	| vertexList |

	at { :self :index |
		self.vertexList.at(index)
	}

	compare { :self :anEdge |
		self.vertexList.compare(anEdge.vertexList)
	}

	DirectedEdge { :self |
		let [i, j] = self.vertexList;
		DirectedEdge(i, j)
	}

	Edge { :self |
		self
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

	isSelfLoop { :self |
		let [i, j] = self.vertexList;
		i = j
	}

	isUndirected { :self |
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
		aDictionary[self[1]] --- aDictionary[self[2]]
	}

	size { :self |
		2
	}

	UndirectedEdge { :self |
		self
	}

}

+List {

	Edge { :self |
		let [i, j] = self;
		UndirectedEdge(i, j)
	}

}

+SmallFloat {

	--- { :self :anInteger |
		UndirectedEdge(self, anInteger)
	}

	UndirectedEdge { :self :anInteger |
		newUndirectedEdge().initializeSlots(
			[self, anInteger].sort!
		)
	}

}
