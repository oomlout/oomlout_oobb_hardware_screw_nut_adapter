$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -30.0]) {
			cylinder(h = 33, r = 10.0);
		}
		#translate(v = [0, 0, -33.0]) {
			cylinder(h = 33, r = 2.875);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -33.0]) {
							cylinder(h = 33, r = 1.0);
						}
						translate(v = [0, 0, -0.85]) {
							cylinder(h = 0.85, r1 = 1.35, r2 = 3.0);
						}
						translate(v = [0, 0, -33.0]) {
							cylinder(h = 33, r = 1.35);
						}
						translate(v = [0, 0, -33.0]) {
							cylinder(h = 33, r = 1.0);
						}
					}
					union();
				}
			}
		}
		#cylinder(h = 3, r = 5.0);
	}
}
