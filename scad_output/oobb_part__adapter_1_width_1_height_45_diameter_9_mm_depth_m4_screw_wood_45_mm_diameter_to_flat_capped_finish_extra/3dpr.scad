$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -9.0000000000]) {
			cylinder(h = 12, r = 22.5000000000);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -12.0000000000]) {
							cylinder(h = 12, r = 2.6000000000);
						}
						translate(v = [0, 0, -3.9000000000]) {
							cylinder(h = 3.9000000000, r1 = 2.8750000000, r2 = 5.4000000000);
						}
						translate(v = [0, 0, -12.0000000000]) {
							cylinder(h = 12, r = 2.8750000000);
						}
						translate(v = [0, 0, -12.0000000000]) {
							cylinder(h = 12, r = 2.6000000000);
						}
					}
					union();
				}
			}
		}
		#cylinder(h = 3, r = 5.0000000000);
	}
}