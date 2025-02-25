$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -3.0000000000]) {
			cylinder(h = 3, r1 = 5.1250000000, r2 = 4.8750000000);
		}
	}
	union();
}