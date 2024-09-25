$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -7.0000000000]) {
			cylinder(h = 7, r = 15.0000000000);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						#translate(v = [0, 0, -9.0000000000]) {
							cylinder(h = 9, r = 2.2500000000);
						}
						#translate(v = [0, 0, -5.9000000000]) {
							cylinder(h = 5.9000000000, r1 = 2.5000000000, r2 = 5.9000000000);
						}
						#translate(v = [0, 0, -9.0000000000]) {
							cylinder(h = 9, r = 2.5000000000);
						}
						#translate(v = [0, 0, -9.0000000000]) {
							cylinder(h = 9, r = 2.2500000000);
						}
					}
					union();
				}
			}
		}
	}
}