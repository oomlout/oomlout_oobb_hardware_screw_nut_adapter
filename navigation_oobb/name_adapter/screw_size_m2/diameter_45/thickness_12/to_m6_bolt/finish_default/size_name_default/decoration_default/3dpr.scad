$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -12.0]) {
			cylinder(h = 12, r = 22.5);
		}
		#translate(v = [0, 0, -15.0]) {
			cylinder(h = 15, r = 2.875);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -15.0]) {
							cylinder(h = 15, r = 1.0);
						}
						translate(v = [0, 0, -0.85]) {
							cylinder(h = 0.85, r1 = 1.35, r2 = 3.0);
						}
						translate(v = [0, 0, -15.0]) {
							cylinder(h = 15, r = 1.35);
						}
						translate(v = [0, 0, -15.0]) {
							cylinder(h = 15, r = 1.0);
						}
					}
					union();
				}
			}
		}
	}
}
