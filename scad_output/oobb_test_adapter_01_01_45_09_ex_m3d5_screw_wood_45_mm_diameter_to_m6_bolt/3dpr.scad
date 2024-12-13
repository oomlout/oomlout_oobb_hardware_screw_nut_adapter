$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -9.0000000000]) {
			cylinder(h = 9, r = 22.5000000000);
		}
		translate(v = [0, 0, -12.0000000000]) {
			cylinder(h = 12, r = 2.8750000000);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -12.0000000000]) {
							cylinder(h = 12, r = 2.2500000000);
						}
						translate(v = [0, 0, -4.2000000000]) {
							cylinder(h = 4.2000000000, r1 = 2.3750000000, r2 = 4.5000000000);
						}
						translate(v = [0, 0, -12.0000000000]) {
							cylinder(h = 12, r = 2.3750000000);
						}
						translate(v = [0, 0, -12.0000000000]) {
							cylinder(h = 12, r = 2.2500000000);
						}
					}
					union();
				}
			}
		}
	}
}