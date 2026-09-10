/* http://sccode.org/1-4Qy (F0) ; 0322 */
let f = [1 .. 12].fibonacci / (SinOscFb(1 / [2 4], 0) % 1 + 0.125).Round(1);
let c = SinOscFb(f, 1);
let m = c > 0 * [9 2 3 0 7 5] + 55;
SinOscFb(m.MidiCps, SinOscFb(c / 999, 0) + 1 / 2).Splay / 3

# Notes

`fibonacci` answers the _n-th_ item of the Fibonacci sequence:

```
>>> [1 .. 12].fibonacci
[1 1 2 3 5 8 13 21 34 55 89 144]
```
