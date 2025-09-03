# masinaConsonanceData

- _masinaConsonanceData(system)_

A table of perceptual data on the consonance of dyads as reported by Masina et. al.

A table of thirty eight entries,
each entry is a triple _(r, m, σ)_,
where _r_ is the interval ration,
_m_ is the mean of the reported consonance in _(0,1)_,
and σ is the standard deviation of the responses.

```
>>> system.masinaConsonanceData.shape
[38 3]
```

Plot ratio on _x_ axis and consonance measure on _y_ axis:

~~~spl svg=A
system
.masinaConsonanceData
.columns([1 2])
.discretePlot
~~~

![](sw/spl/Help/Image/masinaConsonanceData-A.svg)

Plot only the first twenty four places,
corresponding to the intervals up to one ocatave:

~~~spl svg=B
system
.masinaConsonanceData
.columns([1 2])
.first(24)
.discretePlot
~~~

![](sw/spl/Help/Image/masinaConsonanceData-B.svg)

Table of ratios within the octave:

~~~spl html=A
Table(
	system
	.masinaConsonanceData
	.column(1)
	.select { :each |
		each <= 2
	}
	.collect { :each |
		[
			each,
			each.intervalNameList[1]
		]
	},
	['Ratio', 'Name']
).asHtml
~~~

<table class="TableData">
<tr><th></th><th scope="col">Ratio</th><th scope="col">Name</th></tr>
<tr><th scope="row">1</th><td>33/32</td><td>undecimal comma</td><tr>
<tr><th scope="row">2</th><td>16/15</td><td>minor diatonic semitone</td><tr>
<tr><th scope="row">3</th><td>11/10</td><td>Ptolemy's second</td><tr>
<tr><th scope="row">4</th><td>9/8</td><td>major whole tone</td><tr>
<tr><th scope="row">5</th><td>7/6</td><td>septimal minor third</td><tr>
<tr><th scope="row">6</th><td>6/5</td><td>minor third</td><tr>
<tr><th scope="row">7</th><td>11/9</td><td>undecimal neutral third</td><tr>
<tr><th scope="row">8</th><td>5/4</td><td>major third</td><tr>
<tr><th scope="row">9</th><td>9/7</td><td>septimal major third</td><tr>
<tr><th scope="row">10</th><td>4/3</td><td>perfect fourth</td><tr>
<tr><th scope="row">11</th><td>11/8</td><td>undecimal semi-augmented fourth</td><tr>
<tr><th scope="row">12</th><td>7/5</td><td>septimal or Huygens' tritone</td><tr>
<tr><th scope="row">13</th><td>16/11</td><td>undecimal semi-diminished fifth</td><tr>
<tr><th scope="row">14</th><td>3/2</td><td>perfect fifth</td><tr>
<tr><th scope="row">15</th><td>14/9</td><td>septimal minor sixth</td><tr>
<tr><th scope="row">16</th><td>8/5</td><td>minor sixth</td><tr>
<tr><th scope="row">17</th><td>18/11</td><td>undecimal neutral sixth</td><tr>
<tr><th scope="row">18</th><td>5/3</td><td>major sixth</td><tr>
<tr><th scope="row">19</th><td>7/4</td><td>harmonic seventh</td><tr>
<tr><th scope="row">20</th><td>9/5</td><td>just minor seventh</td><tr>
<tr><th scope="row">21</th><td>11/6</td><td>undecimal neutral seventh</td><tr>
<tr><th scope="row">22</th><td>15/8</td><td>classic major seventh</td><tr>
<tr><th scope="row">23</th><td>27/14</td><td>septimal major seventh</td><tr>
<tr><th scope="row">24</th><td>2/1</td><td>octave</td><tr>
</table>

* * *

See also: Fraction, Tuning

Guides: Library Catalogue, Tuning Functions

Further Reading: Masina 2022
