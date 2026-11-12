# Fractions and Decimals

Fraction inputs will provide exact output:

```
>>> 1/4 + 1/3
7/12

>>> (1.0 / 4.0) + (1.0 / 3.0)
0.583333
```

Any input containing floating point decimal values gives approximate output:

```
>>> 0.25 + 1/3
0.583333
```

Use `Float`,
abbreviated as `F`,
to get a numerical approximation of a result:

```
>>> F(1/4 + 1/7)
0.392857
```

Some numbers are better expressed in `Scientific Notation`:

```
>>> 1.23E-3
0.00123
```

`Scientific Notation` is applied automatically when appropriate:

```
>>> F(100.!)
9.3326E+157
```
