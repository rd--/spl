+Fraction{
	fabiusFunction { :x :n |
		let dyadicRationals = { :x :n |
			let m = 2 ^ n;
			[0 .. x * m].collect { :k |
				k \ m
			}
		};
		(2 ^ (n * (n + 1) / 2))
		/
		n.factorial
		*
		dyadicRationals(x, n).sum { :k |
			(-1 ^ digitSum((k * (2 ^ n)).asLargeInteger, 2)) * ((x - k) ^ n)
		}
	}
	fabiusFunction { :x |
		fabiusFunction(x, 8)
	}
}
+SmallFloat{
	fabiusFunction { :x |
		x.asFraction.fabiusFunction
	}
}

(0 -- 1).functionPlot(fabiusFunction:/1)

(0 -- 2).functionPlot(fabiusFunction:/1)

>>> fabiusFunction(5/16, 8).roundTo(0.01)
0.15

>>> fabiusFunction(2/3, 8)
>>> .roundTo(0.01)
0.82

>>> fabiusFunction(0.775.asFraction, 8)
>>> .roundTo(0.01)
0.95

7433308467246526619611889991400506021737941236939505715172752016184887007/9066697674654011376660377237138474711961720399951641677924569394458918912.asFloat


fabiusFunction(12, 1/2)

5 / 72
1 / 288

DyadicRationals[x_, n_] := Table[k/(2^n), {k, 0, Floor[x*2^n]}]

(* Digitsum[j, 2] is the function s[j] returning the occurrences of 1s in the binary representation of the integer j *)

Fabius[n_Integer, x_Real] := 
 2^(n (n + 1)/2)/
   n!  Sum[(-1)^DigitSum[k  2^n, 2] (x - k)^n, {k, 
    DyadicRationals[x, n]}]



-1 ^ 1/2

let r = 8;
1:r.collect { :n |
	fabiusFunction(n \ r)
}


  c[0] = 1; c[n_] := c[n] = Sum[c[n - m]/(2 m + 1)!, {m, n}]/(4^n - 1);
  d[n_] := d[n] = Sum[c[m]/(n - 2 m)!, {m, 0, n/2}]/2^(n (n + 1)/2);
  f[x_, p_] := f[x, p] = Module[{z = x, n, s, y = 0},
     While[z > 0,
       n = -Floor[Log2[z]]; z -= 2^-n;
       s = d[n] + Sum[d[n - m] 2^(m (m + 1)/2) z^m/m!, {m, n}]; y = s - y;
       If[p < Infinity && Abs[s/y] < 10^-p, Break[]]];
     SetPrecision[Abs[y], p]];

  fabius[x_] /; ExactNumberQ[x] && IntegerQ[Log2[Denominator[x]]] && 0 <= x <= 2 :=
  f[x, Infinity];
  fabius[x_] /; NumericQ[x] && x > 2 := fabius[Mod[x, 2]] t[Quotient[x, 2]];
  fabius[x_] /; NumericQ[x] && Im[x] == 0 && Re[x] >= 0 && Precision[x] < Infinity :=
  f[Rationalize[x, 0], Precision[x]];
  N[fabius[x_], {p_, _}] /; NumericQ[x] && Im[x] == 0 && Re[x] >= 0 := f[x, p];
  Derivative[n_][fabius][x_] := 2^(n (n + 1)/2) fabius[2^n x]];
