# innerProduct

let y = [0 1 2; 3 4 5]; let x = [2 3]; x *.innerProduct(+) y

]y=: i.2 3
0 1 2
3 4 5
   x=: 0 1
   x +/ . * y
3 4 5



let x = [0 0 1; 1 0 0; 0 1 0]; let y = [0 1 0; 0 0 1; 1 0 0]; x +.innerProduct(*) y
