/* http://sccode.org/1-4Qy (F0) ; 0322 */
let f = [1 .. 12].fibonacci / (sinOscFb(1 / [2 4], 0) % 1 + 0.125).round(1);
let c = sinOscFb(f, 1);
let m = c > 0 * [9 2 3 0 7 5] + 55;
sinOscFb(m.midiCps, sinOscFb(c / 999, 0) + 1 / 2).splay / 3

/* Notes:

`fibonacci` answers the _n-th_ item of the Fibonacci sequence:

```
>>> [1 .. 12].fibonacci
[1 1 2 3 5 8 13 21 34 55 89 144]
```
*/
