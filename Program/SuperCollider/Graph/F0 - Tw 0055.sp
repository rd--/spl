/* http://fredrikolofsson.com/f0blog/more-sc-twitter/ F0 ; 0055 */
let o = pulse(pulse([1, 2] / 3, 1 / 9) * 50 + [50, 150], 0.5);
let m = pulse([3, 4], 1 / 3) + pulse([2, 3], 1 / 4) / 10 + 0.005;
combN((slope(o) * m).cos / 5, 1, 1 / 6, 2)
