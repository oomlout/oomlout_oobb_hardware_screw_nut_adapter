$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -0.8500000000000001]) {
			cylinder(h = 3.85, r = 22.5);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -3.85]) {
							cylinder(h = 3.85, r = 1.0);
						}
						translate(v = [0, 0, -0.85]) {
							cylinder(h = 0.85, r1 = 1.35, r2 = 3.0);
						}
						translate(v = [0, 0, -3.85]) {
							cylinder(h = 3.85, r = 1.35);
						}
						translate(v = [0, 0, -3.85]) {
							cylinder(h = 3.85, r = 1.0);
						}
					}
					union();
				}
			}
		}
		#cylinder(h = 3, r = 5.0);
	}
}
