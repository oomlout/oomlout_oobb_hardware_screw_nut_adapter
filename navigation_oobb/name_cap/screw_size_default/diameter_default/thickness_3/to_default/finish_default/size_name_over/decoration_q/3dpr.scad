$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -5.0000000000]) {
			cylinder(h = 5, r = 9.0000000000);
		}
	}
	union() {
		#translate(v = [0, 0, -5.0000000000]) {
			cylinder(h = 3, r1 = 7.0750000000, r2 = 6.9250000000);
		}
		translate(v = [0, 0, -1]) {
			linear_extrude(height = 1) {
				text(font = "Impact", halign = "center", size = 10, text = "Q", valign = "center");
			}
		}
	}
}