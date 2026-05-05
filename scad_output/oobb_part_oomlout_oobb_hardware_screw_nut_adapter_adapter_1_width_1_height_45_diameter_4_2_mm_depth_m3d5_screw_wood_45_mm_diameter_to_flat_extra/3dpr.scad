$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -4.2]) {
			cylinder(h = 4.2, r = 22.5);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -7.2]) {
							cylinder(h = 7.2, r = 2.25);
						}
						translate(v = [0, 0, -4.2]) {
							cylinder(h = 4.2, r1 = 2.375, r2 = 4.5);
						}
						translate(v = [0, 0, -7.2]) {
							cylinder(h = 7.2, r = 2.375);
						}
						translate(v = [0, 0, -7.2]) {
							cylinder(h = 7.2, r = 2.25);
						}
					}
					union();
				}
			}
		}
	}
}
