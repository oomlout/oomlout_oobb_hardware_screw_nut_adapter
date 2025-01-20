$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -1.9000000000]) {
			cylinder(h = 1.9000000000, r = 7.0000000000);
		}
		translate(v = [0, 0, -4.9000000000]) {
			cylinder(h = 4.9000000000, r = 2.8750000000);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -4.9000000000]) {
							cylinder(h = 4.9000000000, r = 1.5000000000);
						}
						translate(v = [0, 0, -1.9000000000]) {
							cylinder(h = 1.9000000000, r1 = 1.8000000000, r2 = 3.6000000000);
						}
						translate(v = [0, 0, -4.9000000000]) {
							cylinder(h = 4.9000000000, r = 1.8000000000);
						}
						translate(v = [0, 0, -4.9000000000]) {
							cylinder(h = 4.9000000000, r = 1.5000000000);
						}
					}
					union();
				}
			}
		}
	}
}