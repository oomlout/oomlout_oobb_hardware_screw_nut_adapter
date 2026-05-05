$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -18.0]) {
			cylinder(h = 18, r = 10.0);
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
							cylinder(h = 21, r = 2.25);
						}
						translate(v = [0, 0, -4.2]) {
							cylinder(h = 4.2, r1 = 2.75, r2 = 5.5);
						}
						translate(v = [0, 0, -21.0]) {
							cylinder(h = 21, r = 2.75);
						}
						translate(v = [0, 0, -21.0]) {
							cylinder(h = 21, r = 2.25);
						}
					}
					union();
				}
			}
		}
	}
}
