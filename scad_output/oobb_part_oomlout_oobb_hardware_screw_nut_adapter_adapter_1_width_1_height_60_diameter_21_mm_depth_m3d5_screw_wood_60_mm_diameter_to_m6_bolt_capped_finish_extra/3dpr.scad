$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -21.0]) {
			cylinder(h = 24, r = 30.0);
		}
		#translate(v = [0, 0, -24.0]) {
			cylinder(h = 24, r = 2.875);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -24.0]) {
							cylinder(h = 24, r = 2.25);
						}
						translate(v = [0, 0, -4.2]) {
							cylinder(h = 4.2, r1 = 2.375, r2 = 4.5);
						}
						translate(v = [0, 0, -24.0]) {
							cylinder(h = 24, r = 2.375);
						}
						translate(v = [0, 0, -24.0]) {
							cylinder(h = 24, r = 2.25);
						}
					}
					union();
				}
			}
		}
		#cylinder(h = 3, r = 5.0);
	}
}
