# rgbString

- _rgbString(aColour)_

Answer the _Svg_ or _Css_ format _rgb_ notation string for _aColour_.

At `RgbColour`

```
>>> RgbColour([1, 0.8, 0.25], 1).rgbString
'rgb(255,204,64)'
```

With `alpha`:

```
>>> RgbColour([0.2, 0.6, 0.75], 0.25).rgbString
'rgba(51,153,191,0.25)'
```

At `SrgbColour`:

```
>>> SrgbColour([1, 0.8, 0.25], 1).rgbString
'rgb(255,204,64)'
```

* * *

See also: Colour, Svg
