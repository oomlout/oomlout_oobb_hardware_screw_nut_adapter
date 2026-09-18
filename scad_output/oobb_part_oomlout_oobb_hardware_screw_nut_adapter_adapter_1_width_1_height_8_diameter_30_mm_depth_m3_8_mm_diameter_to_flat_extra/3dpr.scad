$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -30.0]) {
			cylinder(h = 30, r = 4.0);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -33.0]) {
							cylinder(h = 33, r = 1.5);
						}
						translate(v = [0, 0, -1.9]) {
							cylinder(h = 1.9, r1 = 1.8, r2 = 3.6);
						}
						translate(v = [0, 0, -33.0]) {
							cylinder(h = 33, r = 1.8);
						}
						translate(v = [0, 0, -33.0]) {
							cylinder(h = 33, r = 1.5);
						}
					}
					union();
				}
			}
		}
	}
}
