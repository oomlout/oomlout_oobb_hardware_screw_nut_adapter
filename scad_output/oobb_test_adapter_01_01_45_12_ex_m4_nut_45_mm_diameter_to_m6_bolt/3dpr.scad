$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -13.5000000000]) {
			cylinder(h = 13.5000000000, r = 22.5000000000);
		}
		translate(v = [0, 0, -15.0000000000]) {
			cylinder(h = 15, r = 2.8750000000);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -3.2000000000]) {
							linear_extrude(height = 3.2000000000) {
								polygon(points = [[4.2698000000, 0.0000000000], [2.1349000000, 3.6977552691], [-2.1349000000, 3.6977552691], [-4.2698000000, 0.0000000000], [-2.1349000000, -3.6977552691], [2.1349000000, -3.6977552691]]);
							}
						}
					}
					union();
				}
			}
		}
		#translate(v = [0, 0, -100.0000000000]) {
			cylinder(h = 200, r = 2.2500000000);
		}
	}
}