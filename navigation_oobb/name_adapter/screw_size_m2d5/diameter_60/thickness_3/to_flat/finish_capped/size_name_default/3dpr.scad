$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -3.0000000000]) {
			cylinder(h = 6, r = 30.0000000000);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -6.0000000000]) {
							cylinder(h = 6, r = 1.2500000000);
						}
						translate(v = [0, 0, -1.0000000000]) {
							cylinder(h = 1.0000000000, r1 = 1.5500000000, r2 = 3.4500000000);
						}
						translate(v = [0, 0, -6.0000000000]) {
							cylinder(h = 6, r = 1.5500000000);
						}
						translate(v = [0, 0, -6.0000000000]) {
							cylinder(h = 6, r = 1.2500000000);
						}
					}
					union();
				}
			}
		}
		#cylinder(h = 3, r = 5.0000000000);
	}
}