$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -3.0000000000]) {
			cylinder(h = 3, r1 = 5.0000000000, r2 = 5.2500000000);
		}
	}
	union();
}