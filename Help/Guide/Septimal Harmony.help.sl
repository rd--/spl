# Septimal Harmony

A table of useful unison vectors for septimal harmony:

```
[
	-7 4 1;
	-1 -2 4;
	-8 2 5;
	 9 3 -4;
	 8 1 0;
	 1 5 1;
	 0 3 5;
	-8 -6 2;
	 1 -3 -2;
	 0 -5 2;
	-7 -1 3;
	 2 2 -1;
	 8 -4 2;
	-5 6 0;
	 1 0 3;
	 3 7 0;
	-5 -2 -3;
	 3 -1 -3;
	-4 3 -2;
	 2 -3 1;
	-5 1 2;
	 10 -2 1;
	 3 2 2;
	-3 0 -4;
	 3 -6 -1;
	-4 -2 0;
	 5 1 -4;
	 4 -1 0;
	-3 3 1;
	 12 0 0;
	 5 4 1;
	 4 2 5;
	-3 -5 -2;
	-10 -1 -1;
	 5 -4 -2;
	-2 0 -1;
	-3 -2 3;
	-1 5 0;
	-2 3 4;
	-1 -3 -3;
	-8 1 -2;
	-9 -1 2;
	 0 2 -2;
	-1 0 2;
	 1 7 -1;
	 7 1 2;
	 0 5 3;
	 1 -1 -4;
	 0 -3 0;
	-7 1 1;
	 2 4 -3;
	 1 2 1;
	 0 0 5;
	 1 -6 -2;
	-6 -2 -1;
	 2 -1 -1;
	-6 1 4;
	 2 2 4;
	 2 -6 1;
	-5 -2 2;
	 4 1 -2;
	 3 -1 2;
	-4 3 3;
	 4 -4 0;
	-3 0 1;
	-1 2 0;
	 1 -1 1;
	 3 1 0;
	-1 4 -2
].collect { :e |
	let f = [[3 5 7], e].transpose;
	let r = f.factoredInteger.octaveReduce;
	let c = r.ratioToCents;
	[
		e.commaSeparatedString,
		r,
		c.printString(10, 2)
	]
}.Table.asHtml
```

<table class="TableData">
<tr><th></th><th scope="col">1</th><th scope="col">2</th><th scope="col">3</th></tr>
<tr><th scope="row">1</th><td>-7, 4, 1</td><td>4375/4374</td><td>0.40</td><tr>
<tr><th scope="row">2</th><td>-1, -2, 4</td><td>2401/2400</td><td>0.72</td><tr>
<tr><th scope="row">3</th><td>-8, 2, 5</td><td>420175/419904</td><td>1.12</td><tr>
<tr><th scope="row">4</th><td>9, 3, -4</td><td>2460375/2458624</td><td>1.23</td><tr>
<tr><th scope="row">5</th><td>8, 1, 0</td><td>32805/32768</td><td>1.95</td><tr>
<tr><th scope="row">6</th><td>1, 5, 1</td><td>65625/65536</td><td>2.35</td><tr>
<tr><th scope="row">7</th><td>0, 3, 5</td><td>2100875/2097152</td><td>3.07</td><tr>
<tr><th scope="row">8</th><td>-8, -6, 2</td><td>102760448/102515625</td><td>4.13</td><tr>
<tr><th scope="row">9</th><td>1, -3, -2</td><td>6144/6125</td><td>5.36</td><tr>
<tr><th scope="row">10</th><td>0, -5, 2</td><td>3136/3125</td><td>6.08</td><tr>
<tr><th scope="row">11</th><td>-7, -1, 3</td><td>10976/10935</td><td>6.48</td><tr>
<tr><th scope="row">12</th><td>2, 2, -1</td><td>225/224</td><td>7.71</td><tr>
<tr><th scope="row">13</th><td>8, -4, 2</td><td>321489/320000</td><td>8.04</td><tr>
<tr><th scope="row">14</th><td>-5, 6, 0</td><td>15625/15552</td><td>8.11</td><tr>
<tr><th scope="row">15</th><td>1, 0, 3</td><td>1029/1024</td><td>8.43</td><tr>
<tr><th scope="row">16</th><td>3, 7, 0</td><td>2109375/2097152</td><td>10.06</td><tr>
<tr><th scope="row">17</th><td>-5, -2, -3</td><td>2097152/2083725</td><td>11.12</td><tr>
<tr><th scope="row">18</th><td>3, -1, -3</td><td>1728/1715</td><td>13.07</td><tr>
<tr><th scope="row">19</th><td>-4, 3, -2</td><td>4000/3969</td><td>13.47</td><tr>
<tr><th scope="row">20</th><td>2, -3, 1</td><td>126/125</td><td>13.79</td><tr>
<tr><th scope="row">21</th><td>-5, 1, 2</td><td>245/243</td><td>14.19</td><tr>
<tr><th scope="row">22</th><td>10, -2, 1</td><td>413343/409600</td><td>15.75</td><tr>
<tr><th scope="row">23</th><td>3, 2, 2</td><td>33075/32768</td><td>16.14</td><tr>
<tr><th scope="row">24</th><td>-3, 0, -4</td><td>65536/64827</td><td>18.83</td><tr>
<tr><th scope="row">25</th><td>3, -6, -1</td><td>110592/109375</td><td>19.16</td><tr>
<tr><th scope="row">26</th><td>-4, -2, 0</td><td>2048/2025</td><td>19.55</td><tr>
<tr><th scope="row">27</th><td>5, 1, -4</td><td>2430/2401</td><td>20.79</td><tr>
<tr><th scope="row">28</th><td>4, -1, 0</td><td>81/80</td><td>21.51</td><tr>
<tr><th scope="row">29</th><td>-3, 3, 1</td><td>875/864</td><td>21.90</td><tr>
<tr><th scope="row">30</th><td>12, 0, 0</td><td>531441/524288</td><td>23.46</td><tr>
<tr><th scope="row">31</th><td>5, 4, 1</td><td>1063125/1048576</td><td>23.86</td><tr>
<tr><th scope="row">32</th><td>4, 2, 5</td><td>34034175/33554432</td><td>24.58</td><tr>
<tr><th scope="row">33</th><td>-3, -5, -2</td><td>4194304/4134375</td><td>24.91</td><tr>
<tr><th scope="row">34</th><td>-10, -1, -1</td><td>2097152/2066715</td><td>25.31</td><tr>
<tr><th scope="row">35</th><td>5, -4, -2</td><td>31104/30625</td><td>26.87</td><tr>
<tr><th scope="row">36</th><td>-2, 0, -1</td><td>64/63</td><td>27.26</td><tr>
<tr><th scope="row">37</th><td>-3, -2, 3</td><td>686/675</td><td>27.99</td><tr>
<tr><th scope="row">38</th><td>-1, 5, 0</td><td>3125/3072</td><td>29.61</td><tr>
<tr><th scope="row">39</th><td>-2, 3, 4</td><td>300125/294912</td><td>30.33</td><tr>
<tr><th scope="row">40</th><td>-1, -3, -3</td><td>131072/128625</td><td>32.63</td><tr>
<tr><th scope="row">41</th><td>-8, 1, -2</td><td>327680/321489</td><td>33.02</td><tr>
<tr><th scope="row">42</th><td>-9, -1, 2</td><td>100352/98415</td><td>33.74</td><tr>
<tr><th scope="row">43</th><td>0, 2, -2</td><td>50/49</td><td>34.98</td><tr>
<tr><th scope="row">44</th><td>-1, 0, 2</td><td>49/48</td><td>35.70</td><tr>
<tr><th scope="row">45</th><td>1, 7, -1</td><td>234375/229376</td><td>37.33</td><tr>
<tr><th scope="row">46</th><td>7, 1, 2</td><td>535815/524288</td><td>37.65</td><tr>
<tr><th scope="row">47</th><td>0, 5, 3</td><td>1071875/1048576</td><td>38.05</td><tr>
<tr><th scope="row">48</th><td>1, -1, -4</td><td>12288/12005</td><td>40.34</td><tr>
<tr><th scope="row">49</th><td>0, -3, 0</td><td>128/125</td><td>41.06</td><tr>
<tr><th scope="row">50</th><td>-7, 1, 1</td><td>2240/2187</td><td>41.45</td><tr>
<tr><th scope="row">51</th><td>2, 4, -3</td><td>5625/5488</td><td>42.69</td><tr>
<tr><th scope="row">52</th><td>1, 2, 1</td><td>525/512</td><td>43.41</td><tr>
<tr><th scope="row">53</th><td>0, 0, 5</td><td>16807/16384</td><td>44.13</td><tr>
<tr><th scope="row">54</th><td>1, -6, -2</td><td>786432/765625</td><td>46.42</td><tr>
<tr><th scope="row">55</th><td>-6, -2, -1</td><td>131072/127575</td><td>46.82</td><tr>
<tr><th scope="row">56</th><td>2, -1, -1</td><td>36/35</td><td>48.77</td><tr>
<tr><th scope="row">57</th><td>-6, 1, 4</td><td>12005/11664</td><td>49.89</td><tr>
<tr><th scope="row">58</th><td>2, 2, 4</td><td>540225/524288</td><td>51.84</td><tr>
<tr><th scope="row">59</th><td>2, -6, 1</td><td>16128/15625</td><td>54.85</td><tr>
<tr><th scope="row">60</th><td>-5, -2, 2</td><td>6272/6075</td><td>55.25</td><tr>
<tr><th scope="row">61</th><td>4, 1, -2</td><td>405/392</td><td>56.48</td><tr>
<tr><th scope="row">62</th><td>3, -1, 2</td><td>1323/1280</td><td>57.20</td><tr>
<tr><th scope="row">63</th><td>-4, 3, 3</td><td>42875/41472</td><td>57.60</td><tr>
<tr><th scope="row">64</th><td>4, -4, 0</td><td>648/625</td><td>62.57</td><tr>
<tr><th scope="row">65</th><td>-3, 0, 1</td><td>28/27</td><td>62.96</td><tr>
<tr><th scope="row">66</th><td>-1, 2, 0</td><td>25/24</td><td>70.67</td><tr>
<tr><th scope="row">67</th><td>1, -1, 1</td><td>21/20</td><td>84.47</td><tr>
<tr><th scope="row">68</th><td>3, 1, 0</td><td>135/128</td><td>92.18</td><tr>
<tr><th scope="row">69</th><td>-1, 4, -2</td><td>625/588</td><td>105.65</td><tr>
</table>

* * *

Guides: Tuning Functions, Xenharmonic Functions

