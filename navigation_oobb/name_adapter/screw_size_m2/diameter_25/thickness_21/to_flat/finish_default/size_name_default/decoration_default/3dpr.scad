$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -21.0000000000]) {
			cylinder(h = 21, r = 12.5000000000);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -24.0000000000]) {
							cylinder(h = 24, r = 1.0000000000);
						}
						translate(v = [0, 0, -0.8500000000]) {
							cylinder(h = 0.8500000000, r1 = 1.3500000000, r2 = 3.0000000000);
						}
						translate(v = [0, 0, -24.0000000000]) {
							cylinder(h = 24, r = 1.3500000000);
						}
						translate(v = [0, 0, -24.0000000000]) {
							cylinder(h = 24, r = 1.0000000000);
						}
					}
					union();
				}
			}
		}
	}
}