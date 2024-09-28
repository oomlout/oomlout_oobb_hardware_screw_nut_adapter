$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -7.0000000000]) {
			cylinder(h = 7, r = 7.0000000000);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						#translate(v = [0, 0, -9.0000000000]) {
							cylinder(h = 9, r = 2.0000000000);
						}
						#translate(v = [0, 0, -3.7000000000]) {
							cylinder(h = 3.7000000000, r1 = 2.1250000000, r2 = 4.3750000000);
						}
						#translate(v = [0, 0, -9.0000000000]) {
							cylinder(h = 9, r = 2.1250000000);
						}
						#translate(v = [0, 0, -9.0000000000]) {
							cylinder(h = 9, r = 2.0000000000);
						}
					}
					union();
				}
			}
		}
	}
}