# Experimental Constant Syntax

Constants can be defined using the experimental syntax _Constant.name = value_.

The package _SmallFloat_ defines a number of constants.

~~~
Constant.pi = 3.1415926535897932384626433;
Constant.e = 2.7182818284590452353602875;
Constant.epsilon = 0.000000000000001;
~~~

These are available as predefined names:

```
>>> 1.pi
3.14159

>>> 1.e
2.71828

>>> 1.epsilon
0.0
```

Constant methods have arity qualifiers and may be shadowed:

```
>>> let pi = 22/7;
>>> pi
22/7
```
