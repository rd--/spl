# planarAngle

- _planarAngle(q1, p, q2)_

Answer the angle subtended by the line segment _q1, q2_ from _p_.

The angle between the half-lines from (0,0) through (1,1) and (1,0):

```
>>> [1 0; 0 0; 1 1].planarAngle
(pi / 4)
```

The angle formed by a triangle at origin:

```
>>> [0 1; 0 0; 1 0].planarAngle
(pi / 2)
```

A straight angle:

```
>>> [1 0; 0 0; -1 0].planarAngle
pi
```

An obtuse angle:

```
>>> [1 0; 0 0; -1 1].planarAngle
(3.pi / 4)
```

A right angle:

```
>>> [1 0; 0 0; 0 1].planarAngle
(pi / 2)
```

An acute angle:

```
>>> [1 0; 0 0; 1 1].planarAngle
(pi / 4)
```

All interior angles of a triangle:

```
>>> let [a, b, c] = [[0, 0], [2, 0], [3 / 2, 3.sqrt / 2]];
>>> [b a c; c b a; a c b].collect(planarAngle:/1)
[pi / 6, pi / 3, pi / 2]
```

At specific values:

```
>>> [-2 1; 2 3; -2 -4].planarAngle
(2 / 3).arcTan
```

Relation between `planarAngle` of _(q2, p, q1)_ and _(q1, p, q2)_:

```
>>> let [q2, p, q1] = [1 1; 2 1; 1 0];
>>> (
>>> 	[q2 p q1].planarAngle,
>>> 	[q1 p q2].planarAngle
>>> )

(pi / 4, pi / 4)
```
In[1]:=	PlanarAngle[{2, 1} -> {{1, 1}, {1, 0}}]	https://wolfram.com/xid/0n4mw4d17jq-414zxc
Out[1]=	
In[2]:=	2 Pi - PlanarAngle[{2, 1} -> {{1, 0}, {1, 1}}]	https://wolfram.com/xid/0n4mw4d17jq-0xtjvx
Out[2]=	
PlanarAngle[{q1,p,q2},"Interior"] is the smallest angle formed by the rotations around p:

In[1]:=	PlanarAngle[{{1, 1}, {2, 1}, {1, 0}}, "Interior"]	https://wolfram.com/xid/0n4mw4d17jq-gav70s
Out[1]=	
In[2]:=		https://wolfram.com/xid/0n4mw4d17jq-xwkpin
Out[2]=	
PlanarAngle[p{q1,q2}] takes values from 0 to 2π:

In[1]:=		https://wolfram.com/xid/0n4mw4d17jq-knnf7m
Out[1]=	
PlanarAngle[{q1,p,q2}] takes values from 0 to π:

In[1]:=		https://wolfram.com/xid/0n4mw4d17jq-pac8dj
Out[1]=	
Dihedral angle is the planar angle in the plane defined by the normal p2-p1 and a point p1:

In[1]:=		https://wolfram.com/xid/0n4mw4d17jq-p3qmdf
In[2]:=		https://wolfram.com/xid/0n4mw4d17jq-jg3w5h
Out[2]=	
In[3]:=		https://wolfram.com/xid/0n4mw4d17jq-qqzulz
Out[3]=	
PlanarAngle[p->{q1,q2}] is equivalent to PolygonAngle[ℛ, p] where q1 and q2 are adjacent points of p in a polygon ℛ:

In[1]:=		https://wolfram.com/xid/0n4mw4d17jq-fsm0rj
Out[1]=	
In[2]:=		https://wolfram.com/xid/0n4mw4d17jq-h3aavt
Out[2]=	
In[3]:=		https://wolfram.com/xid/0n4mw4d17jq-80zo14
Out[3]=	
PlanarAngle[{q1,p,q2}] is equivalent to SolidAngle[p,{q1,q2}:

In[1]:=		https://wolfram.com/xid/0n4mw4d17jq-1kxdnt
Out[1]=	
In[2]:=		https://wolfram.com/xid/0n4mw4d17jq-0uz03d
Out[2]=	
In[3]:=		https://wolfram.com/xid/0n4mw4d17jq-chwid9
Out[3]=	
Possible Issues  (1)
PlanarAngle gives generic values for symbolic parameters:

In[1]:=		https://wolfram.com/xid/0n4mw4d17jq-ykpc2
Out[1]=	
See Also
VectorAngle SolidAngle DihedralAngle PolygonAngle PolyhedronAngle Dot AnglePath AngleBisector GeometricScene

Related Guides
Region Properties and Measures
Synthetic Geometry
Angles and Polar Coordinates
Plane Geometry
History
Introduced in 2019 (12.0)

Cite this as:	Wolfram Research (2019), PlanarAngle, Wolfram Language function, https://reference.wolfram.com/language/ref/PlanarAngle.html.Wolfram Research (2019), PlanarAngle, Wolfram Language function, https://reference.wolfram.com/language/ref/PlanarAngle.html.
Give FeedbackTop
 Introduction for Programmers Introductory Book
Wolfram Function Repository | Wolfram Data Repository | Wolfram Data Drop | Wolfram Language Products
Top
© 2024 Wolfram. All rights reserved.
 
English
Legal & Privacy PolicySite MapWolframAlpha.comWolframCloud.com
