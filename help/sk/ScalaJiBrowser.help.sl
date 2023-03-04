# ScalaJiBrowser -- tuning browser

```
system.window.fetchJson(
	'https://rohandrape.net/sw/hmt/data/json/scala-ji-tuning.json',
	()
).then { :answer |
	workspace::ji := answer;
	workspace::smallKansas.ScalaJiBrowser(workspace::ji, nil)
}
```
