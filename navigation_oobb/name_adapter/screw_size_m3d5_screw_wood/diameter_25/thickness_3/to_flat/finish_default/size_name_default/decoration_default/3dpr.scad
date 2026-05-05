$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -3.0]) {
			cylinder(h = 3, r = 12.5);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -6.0]) {
							cylinder(h = 6, r = 2.25);
						}
						translate(v = [0, 0, -4.2]) {
							cylinder(h = 4.2, r1 = 2.375, r2 = 4.5);
						}
						translate(v = [0, 0, -6.0]) {
							cylinder(h = 6, r = 2.375);
						}
						translate(v = [0, 0, -6.0]) {
							cylinder(h = 6, r = 2.25);
						}
					}
					union();
				}
			}
		}
	}
}
