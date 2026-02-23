+SmallFloat {

	nimMultiplication { :x :y |
		y.isInteger.if {
			nimMultiplication(LargeInteger(x), y.asLargeInteger).normal
		} {
			y.adaptToIntegerAndApply(x, nimMultiplication:/2)
		}
	}

}

+LargeInteger {

	nimMultiplication { :x :y |
		y.isInteger.if {
			uncheckedNimMultiplication(x, y.asLargeInteger)
		} {
			y.adaptToIntegerAndApply(x, nimMultiplication:/2)
		}
	}

	uncheckedNimMultiplication { :x :y |
		/* https://www.math.ucla.edu/~tom/NimProd.html */
		<primitive:
		if (_x < 0 || _y < 0) { throw new Error('nimMultiplication: negative value?'); };
		let mul = function(x,y) {
			if (x>y) {let t=x;x=y;y=t;}
			if (x==BigInt(0)) {return BigInt(0);}
			if (x==BigInt(1)) {return y;}
			if (y==BigInt(2)) {return BigInt(3);}
			if (y==BigInt(3)) {if (x==BigInt(2)) {return BigInt(1);} else {return BigInt(2);}}
			for(let F=BigInt(4); /* */ ;F=F*F) {
				if (y==F) {if (x<y) {return x*y;} else {return BigInt(3)*y/BigInt(2);}}
				if (y<BigInt(2)*F) {return mul(F,x)^mul(y-F,x);}
				for (let t=BigInt(2)*F;t<F*F;t*=BigInt(2)) {
					if (y==t) {
						if (x<F) {return mul(mul(x,t/F),F);}
						for (let i=F;i<t;i*=BigInt(2)) {
							if (x==i) {return mul(mul(F,F),mul(t/F,i/F));}
							if(x<BigInt(2)*i) {return mul(t,i)^mul(t,x-i);}
						}
						if (x==t) {return mul(mul(F,F),mul(t/F,t/F));}
					}
					if (y<BigInt(2)*t) {return mul(t,x)^mul(y-t,x);}
				}
			}
		};
		return mul(_x, _y);
		>
	}

}

+@Integer {

	nimPowerNaive { :n :k |
		{ :x |
			nimMultiplication(x, n)
		}.iterate(1, k)
	}

	nimPower { :n :k |
		let v = 1;
		let p = n;
		let i = 0;
		{ :break:/0 |
			(k.bitAt(i + 1) = 1).ifTrue {
				k := k - (2 ^ i);
				v := v.nimMultiplication(p)
			};
			(k = 0).ifTrue {
				break()
			};
			p := p.nimMultiplication(p);
			i := i + 1
		}.repeatForeverWithBreak;
		v
	}

	nimSquare { :x |
		nimMultiplication(x, x)
	}

}

+List {

	nimValue { :self |
		let k = self.collect(bitLength:/1).max;
		let b = self.collect { :each |
			each.integerDigits(2, k)
		};
		(b.sum % 2).fromDigits(2)
	}

}
