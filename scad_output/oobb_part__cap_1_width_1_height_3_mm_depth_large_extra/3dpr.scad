$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -3.0000000000]) {
			cylinder(h = 3, r1 = 6.2500000000, r2 = 6.5000000000);
		}
	}
	union();
}