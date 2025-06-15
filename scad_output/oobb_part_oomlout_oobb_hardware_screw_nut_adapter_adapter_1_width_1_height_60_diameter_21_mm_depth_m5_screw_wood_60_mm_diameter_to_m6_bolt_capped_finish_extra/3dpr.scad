$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -21.0000000000]) {
			cylinder(h = 24, r = 30.0000000000);
		}
		#translate(v = [0, 0, -24.0000000000]) {
			cylinder(h = 24, r = 2.8750000000);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -24.0000000000]) {
							cylinder(h = 24, r = 2.2500000000);
						}
						translate(v = [0, 0, -4.2000000000]) {
							cylinder(h = 4.2000000000, r1 = 2.7500000000, r2 = 5.5000000000);
						}
						translate(v = [0, 0, -24.0000000000]) {
							cylinder(h = 24, r = 2.7500000000);
						}
						translate(v = [0, 0, -24.0000000000]) {
							cylinder(h = 24, r = 2.2500000000);
						}
					}
					union();
				}
			}
		}
		#cylinder(h = 3, r = 6.2500000000);
	}
}