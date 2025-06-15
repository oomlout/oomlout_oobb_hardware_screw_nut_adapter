$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -27.0000000000]) {
			cylinder(h = 30, r = 15.0000000000);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -30.0000000000]) {
							cylinder(h = 30, r = 1.0000000000);
						}
						translate(v = [0, 0, -0.8500000000]) {
							cylinder(h = 0.8500000000, r1 = 1.3500000000, r2 = 3.0000000000);
						}
						translate(v = [0, 0, -30.0000000000]) {
							cylinder(h = 30, r = 1.3500000000);
						}
						translate(v = [0, 0, -30.0000000000]) {
							cylinder(h = 30, r = 1.0000000000);
						}
					}
					union();
				}
			}
		}
		#cylinder(h = 3, r = 5.0000000000);
	}
}