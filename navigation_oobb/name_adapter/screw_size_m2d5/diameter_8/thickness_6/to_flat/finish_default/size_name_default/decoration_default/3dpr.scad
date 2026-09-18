$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -6.0]) {
			cylinder(h = 6, r = 4.0);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -9.0]) {
							cylinder(h = 9, r = 1.25);
						}
						translate(v = [0, 0, -1.0]) {
							cylinder(h = 1.0, r1 = 1.55, r2 = 3.45);
						}
						translate(v = [0, 0, -9.0]) {
							cylinder(h = 9, r = 1.55);
						}
						translate(v = [0, 0, -9.0]) {
							cylinder(h = 9, r = 1.25);
						}
					}
					union();
				}
			}
		}
	}
}
