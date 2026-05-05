$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -5.0]) {
			cylinder(h = 5, r = 9.0);
		}
	}
	union() {
		#translate(v = [0, 0, -5.0]) {
			cylinder(h = 3, r1 = 7.075, r2 = 6.925);
		}
	}
}
