$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -30.0]) {
			cylinder(h = 30, r = 12.5);
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
							cylinder(h = 33, r = 2.25);
						}
						translate(v = [0, 0, -4.2]) {
							cylinder(h = 4.2, r1 = 2.75, r2 = 5.5);
						}
						translate(v = [0, 0, -33.0]) {
							cylinder(h = 33, r = 2.75);
						}
						translate(v = [0, 0, -33.0]) {
							cylinder(h = 33, r = 2.25);
						}
					}
					union();
				}
			}
		}
	}
}
