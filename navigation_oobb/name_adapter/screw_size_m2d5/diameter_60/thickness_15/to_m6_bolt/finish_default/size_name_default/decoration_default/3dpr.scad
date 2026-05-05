$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -15.0]) {
			cylinder(h = 15, r = 30.0);
		}
		#translate(v = [0, 0, -18.0]) {
			cylinder(h = 18, r = 2.875);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -18.0]) {
							cylinder(h = 18, r = 1.25);
						}
						translate(v = [0, 0, -1.0]) {
							cylinder(h = 1.0, r1 = 1.55, r2 = 3.45);
						}
						translate(v = [0, 0, -18.0]) {
							cylinder(h = 18, r = 1.55);
						}
						translate(v = [0, 0, -18.0]) {
							cylinder(h = 18, r = 1.25);
						}
					}
					union();
				}
			}
		}
	}
}
