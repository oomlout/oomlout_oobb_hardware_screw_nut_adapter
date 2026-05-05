$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -4.2]) {
			cylinder(h = 7.2, r = 15.0);
		}
		#translate(v = [0, 0, -7.2]) {
			cylinder(h = 7.2, r = 2.875);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -7.2]) {
							cylinder(h = 7.2, r = 2.25);
						}
						translate(v = [0, 0, -4.2]) {
							cylinder(h = 4.2, r1 = 2.75, r2 = 5.5);
						}
						translate(v = [0, 0, -7.2]) {
							cylinder(h = 7.2, r = 2.75);
						}
						translate(v = [0, 0, -7.2]) {
							cylinder(h = 7.2, r = 2.25);
						}
					}
					union();
				}
			}
		}
		#cylinder(h = 3, r = 6.25);
	}
}
