# replaceNaN

- _replaceNaN(x, y=0)_

+SmallFloat{
	replaceNaN { :x :y |
		x.isNaN.if {
			y
		} {
			x
		}
	}
}
+@Collection{
	replaceNaN { :x :y |
		x.collect { :each |
			each.replaceNaN(y)
		}
	}
}

