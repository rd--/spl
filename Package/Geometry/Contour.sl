+List {

	bourkeContourAlgorithm { :d :x :y :z :drawContour |
		let [m, n] = d.shape;
		{ x.size = m }.assert;
		{ y.size = n }.assert;
		{ z.size > 0 }.assert;
		{ drawContour.numArgs = 6 }.assert;
		uncheckedBourkeContourAlgorithm(
			d,
			0, m - 1,
			0, n - 1,
			x.asList,
			y.asList,
			z.size, z.asList,
			drawContour
		)
	}

	uncheckedBourkeContourAlgorithm { :d :ilb :iub :jlb :jub :x :y :nc :z :drawContour |
		<primitive:
		/* https://paulbourke.net/papers/conrec/ */
		let d = _d;
		let ilb = _ilb;
		let iub = _iub;
		let jlb = _jlb;
		let jub = _jub;
		let x = _x;
		let y = _y;
		let nc = _nc;
		let z = _z;
		let drawContour = _drawContour;
		let h = new Array(5);
		let sh = new Array(5);
		let xh = new Array(5);
		let yh = new Array(5);
		let xsect = function(p1, p2) {
			return (h[p2]*xh[p1]-h[p1]*xh[p2])/(h[p2]-h[p1]);
		};
		let ysect = function(p1, p2) {
			return (h[p2]*yh[p1]-h[p1]*yh[p2])/(h[p2]-h[p1]);
		}
		let x1 = 0.0;
		let x2 = 0.0;
		let y1 = 0.0;
		let y2 = 0.0;
		let im = [0, 1, 1, 0];
		let jm = [0, 0, 1, 1];
		let castab = [
			[
				[0, 0, 8], [0, 2, 5], [7, 6, 9]
			],
			[
				[0, 3, 4], [1, 3, 1], [4, 3, 0]
			],
			[
				[9, 6, 7], [5, 2, 0], [8, 0, 0]
			]
		];
		for (let j=(jub-1);j>=jlb;j--) {
			for (let i=ilb;i<=iub-1;i++) {
				let temp1 = Math.min(d[i][j],d[i][j+1]);
				let temp2 = Math.min(d[i+1][j],d[i+1][j+1]);
				let dmin  = Math.min(temp1,temp2);
				temp1 = Math.max(d[i][j],d[i][j+1]);
				temp2 = Math.max(d[i+1][j],d[i+1][j+1]);
				let dmax  = Math.max(temp1,temp2);
				if (dmax>=z[0]&&dmin<=z[nc-1]) {
					for (let k=0;k<nc;k++) {
						if (z[k]>=dmin&&z[k]<=dmax) {
							for (let m=4;m>=0;m--) {
								if (m>0) {
									h[m] = d[i+im[m-1]][j+jm[m-1]]-z[k];
									xh[m] = x[i+im[m-1]];
									yh[m] = y[j+jm[m-1]];
								} else {
									h[0] = 0.25*(h[1]+h[2]+h[3]+h[4]);
									xh[0]=0.5*(x[i]+x[i+1]);
									yh[0]=0.5*(y[j]+y[j+1]);
								}
								if (h[m]>0.0) {
									sh[m] = 1;
								} else if (h[m]<0.0) {
									sh[m] = -1;
								} else
								sh[m] = 0;
							}
							for (let m=1;m<=4;m++) {
								let m1 = m;
								let m2 = 0;
								let m3 = null;
								if (m!=4) {
									m3 = m+1;
								} else {
									m3 = 1;
								}
								let caseValue = castab[sh[m1]+1][sh[m2]+1][sh[m3]+1];
								if (caseValue!=0) {
									switch (caseValue) {
										case 1:
										x1=xh[m1];
										y1=yh[m1];
										x2=xh[m2];
										y2=yh[m2];
										break;
										case 2:
										x1=xh[m2];
										y1=yh[m2];
										x2=xh[m3];
										y2=yh[m3];
										break;
										case 3:
										x1=xh[m3];
										y1=yh[m3];
										x2=xh[m1];
										y2=yh[m1];
										break;
										case 4:
										x1=xh[m1];
										y1=yh[m1];
										x2=xsect(m2,m3);
										y2=ysect(m2,m3);
										break;
										case 5:
										x1=xh[m2];
										y1=yh[m2];
										x2=xsect(m3,m1);
										y2=ysect(m3,m1);
										break;
										case 6:
										x1=xh[m3];
										y1=yh[m3];
										x2=xsect(m1,m2);
										y2=ysect(m1,m2);
										break;
										case 7:
										x1=xsect(m1,m2);
										y1=ysect(m1,m2);
										x2=xsect(m2,m3);
										y2=ysect(m2,m3);
										break;
										case 8:
										x1=xsect(m2,m3);
										y1=ysect(m2,m3);
										x2=xsect(m3,m1);
										y2=ysect(m3,m1);
										break;
										case 9:
										x1=xsect(m3,m1);
										y1=ysect(m3,m1);
										x2=xsect(m1,m2);
										y2=ysect(m1,m2);
										break;
										default:
										break;
									}
									drawContour(x1,y1,x2,y2,z[k],k);
								}
							}
						}
					}
				}
			}
		}
		>
	}

}
