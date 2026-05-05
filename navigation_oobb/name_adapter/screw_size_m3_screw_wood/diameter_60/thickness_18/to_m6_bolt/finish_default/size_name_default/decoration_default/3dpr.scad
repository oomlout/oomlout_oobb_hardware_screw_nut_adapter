$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -18.0]) {
			cylinder(h = 18, r = 30.0);
		}
		#translate(v = [0, 0, -21.0]) {
			cylinder(h = 21, r = 2.875);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -21.0]) {
							cylinder(h = 21, r = 2.0);
						}
						translate(v = [0, 0, -3]) {
							cylinder(h = 3, r1 = 2.125, r2 = 3.75);
						}
						translate(v = [0, 0, -21.0]) {
							cylinder(h = 21, r = 2.125);
						}
						translate(v = [0, 0, -21.0]) {
							cylinder(h = 21, r = 2.0);
						}
					}
					union();
				}
			}
		}
	}
}
