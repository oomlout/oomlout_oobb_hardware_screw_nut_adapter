$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -7.5000000000]) {
			cylinder(h = 10.5000000000, r = 30.0000000000);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -2.5000000000]) {
							linear_extrude(height = 2.5000000000) {
								polygon(points = [[3.4620000000, 0.0000000000], [1.7310000000, 2.9981799479], [-1.7310000000, 2.9981799479], [-3.4620000000, 0.0000000000], [-1.7310000000, -2.9981799479], [1.7310000000, -2.9981799479]]);
							}
						}
					}
					union();
				}
			}
		}
		#cylinder(h = 3, r = 5.0000000000);
		#translate(v = [0, 0, -100.0000000000]) {
			cylinder(h = 200, r = 1.8000000000);
		}
	}
}