$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -6.0]) {
			cylinder(h = 6.0, r = 12.5);
		}
		#translate(v = [0, 0, -7.5]) {
			cylinder(h = 7.5, r = 2.875);
		}
	}
	union() {
		translate(v = [0, 0, 0]) {
			rotate(a = [0, 0, 0]) {
				difference() {
					union() {
						translate(v = [0, 0, -4]) {
							linear_extrude(height = 4) {
								polygon(points = [[4.8468, 0.0], [2.4234000000000004, 4.197451927062417], [-2.423399999999999, 4.197451927062417], [-4.8468, 5.935618106107392e-16], [-2.423400000000002, -4.197451927062416], [2.423399999999997, -4.197451927062419]]);
							}
						}
					}
					union();
				}
			}
		}
		#translate(v = [0, 0, -100.0]) {
			cylinder(h = 200, r = 2.75);
		}
	}
}
