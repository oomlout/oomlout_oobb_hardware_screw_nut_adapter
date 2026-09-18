$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -30.0]) {
			cylinder(h = 33, r = 4.0);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -33.0]) {
							cylinder(h = 33, r = 2.0);
						}
						translate(v = [0, 0, -3]) {
							cylinder(h = 3, r1 = 2.125, r2 = 3.75);
						}
						translate(v = [0, 0, -33.0]) {
							cylinder(h = 33, r = 2.125);
						}
						translate(v = [0, 0, -33.0]) {
							cylinder(h = 33, r = 2.0);
						}
					}
					union();
				}
			}
		}
		#cylinder(h = 3, r = 5.0);
	}
}
