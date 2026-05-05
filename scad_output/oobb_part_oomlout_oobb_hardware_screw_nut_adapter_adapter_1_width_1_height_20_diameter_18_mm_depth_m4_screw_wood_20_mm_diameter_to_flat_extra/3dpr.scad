$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -18.0]) {
			cylinder(h = 18, r = 10.0);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -21.0]) {
							cylinder(h = 21, r = 2.6);
						}
						translate(v = [0, 0, -3.9]) {
							cylinder(h = 3.9, r1 = 2.875, r2 = 5.4);
						}
						translate(v = [0, 0, -21.0]) {
							cylinder(h = 21, r = 2.875);
						}
						translate(v = [0, 0, -21.0]) {
							cylinder(h = 21, r = 2.6);
						}
					}
					union();
				}
			}
		}
	}
}
