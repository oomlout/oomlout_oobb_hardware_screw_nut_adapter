$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -3.0000000000]) {
			cylinder(h = 3, r = 6.0000000000);
		}
	}
	union();
}