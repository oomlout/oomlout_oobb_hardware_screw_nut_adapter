$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -5.0000000000]) {
			cylinder(h = 5, r = 9.0000000000);
		}
	}
	union() {
		#translate(v = [0, 0, -5.0000000000]) {
			cylinder(h = 3, r1 = 7.0750000000, r2 = 6.9250000000);
		}
	}
}