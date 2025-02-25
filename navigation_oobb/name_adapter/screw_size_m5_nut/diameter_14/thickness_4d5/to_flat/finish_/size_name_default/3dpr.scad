$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -6.0000000000]) {
			cylinder(h = 6.0000000000, r = 7.0000000000);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -4]) {
							linear_extrude(height = 4) {
								polygon(points = [[4.8468000000, 0.0000000000], [2.4234000000, 4.1974519271], [-2.4234000000, 4.1974519271], [-4.8468000000, 0.0000000000], [-2.4234000000, -4.1974519271], [2.4234000000, -4.1974519271]]);
							}
						}
					}
					union();
				}
			}
		}
		#translate(v = [0, 0, -100.0000000000]) {
			cylinder(h = 200, r = 2.7500000000);
		}
	}
}