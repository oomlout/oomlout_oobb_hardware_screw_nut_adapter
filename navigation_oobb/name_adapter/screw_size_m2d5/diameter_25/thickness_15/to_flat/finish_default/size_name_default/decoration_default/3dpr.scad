$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -15.0000000000]) {
			cylinder(h = 15, r = 12.5000000000);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -18.0000000000]) {
							cylinder(h = 18, r = 1.2500000000);
						}
						translate(v = [0, 0, -1.0000000000]) {
							cylinder(h = 1.0000000000, r1 = 1.5500000000, r2 = 3.4500000000);
						}
						translate(v = [0, 0, -18.0000000000]) {
							cylinder(h = 18, r = 1.5500000000);
						}
						translate(v = [0, 0, -18.0000000000]) {
							cylinder(h = 18, r = 1.2500000000);
						}
					}
					union();
				}
			}
		}
	}
}