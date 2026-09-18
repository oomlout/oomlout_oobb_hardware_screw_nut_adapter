$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -7.5]) {
			cylinder(h = 10.5, r = 4.0);
		}
		#translate(v = [0, 0, -9.0]) {
			cylinder(h = 9, r = 2.875);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -5]) {
							linear_extrude(height = 5) {
								polygon(points = [[5.914249999999999, 0.0], [2.957125, 5.1218907443321156], [-2.9571249999999982, 5.1218907443321156], [-5.914249999999999, 7.242867331857232e-16], [-2.9571250000000022, -5.121890744332115], [2.9571249999999956, -5.121890744332118]]);
							}
						}
					}
					union();
				}
			}
		}
		#cylinder(h = 3, r = 6.25);
		#translate(v = [0, 0, -100.0]) {
			cylinder(h = 200, r = 3.25);
		}
	}
}
