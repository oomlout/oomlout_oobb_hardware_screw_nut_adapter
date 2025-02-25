$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -7.5000000000]) {
			cylinder(h = 10.5000000000, r = 30.0000000000);
		}
		#translate(v = [0, 0, -9.0000000000]) {
			cylinder(h = 9, r = 2.8750000000);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -1.9000000000]) {
							linear_extrude(height = 1.9000000000) {
								polygon(points = [[3.1158000000, 0.0000000000], [1.5579000000, 2.6983619531], [-1.5579000000, 2.6983619531], [-3.1158000000, 0.0000000000], [-1.5579000000, -2.6983619531], [1.5579000000, -2.6983619531]]);
							}
						}
					}
					union();
				}
			}
		}
		#cylinder(h = 3, r = 5.0000000000);
		#translate(v = [0, 0, -100.0000000000]) {
			cylinder(h = 200, r = 1.5500000000);
		}
	}
}