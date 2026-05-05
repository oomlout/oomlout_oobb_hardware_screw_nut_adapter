$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -6.0]) {
			cylinder(h = 6, r = 12.5);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -9.0]) {
							cylinder(h = 9, r = 1.0);
						}
						translate(v = [0, 0, -0.85]) {
							cylinder(h = 0.85, r1 = 1.35, r2 = 3.0);
						}
						translate(v = [0, 0, -9.0]) {
							cylinder(h = 9, r = 1.35);
						}
						translate(v = [0, 0, -9.0]) {
							cylinder(h = 9, r = 1.0);
						}
					}
					union();
				}
			}
		}
	}
}
