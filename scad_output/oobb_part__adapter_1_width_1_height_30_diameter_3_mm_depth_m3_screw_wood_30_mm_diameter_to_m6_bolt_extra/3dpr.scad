$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -3.0000000000]) {
			cylinder(h = 3, r = 15.0000000000);
		}
		#translate(v = [0, 0, -6.0000000000]) {
			cylinder(h = 6, r = 2.8750000000);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -6.0000000000]) {
							cylinder(h = 6, r = 2.0000000000);
						}
						translate(v = [0, 0, -3]) {
							cylinder(h = 3, r1 = 2.1250000000, r2 = 3.7500000000);
						}
						translate(v = [0, 0, -6.0000000000]) {
							cylinder(h = 6, r = 2.1250000000);
						}
						translate(v = [0, 0, -6.0000000000]) {
							cylinder(h = 6, r = 2.0000000000);
						}
					}
					union();
				}
			}
		}
	}
}