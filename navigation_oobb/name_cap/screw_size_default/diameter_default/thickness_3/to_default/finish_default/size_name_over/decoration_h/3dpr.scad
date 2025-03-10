$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -5.0000000000]) {
			cylinder(h = 5, r = 16.0000000000);
		}
	}
	union() {
		#translate(v = [0, 0, -5.0000000000]) {
			cylinder(h = 3, r1 = 13.9250000000, r2 = 14.0750000000);
		}
		translate(v = [0, 0, -1]) {
			linear_extrude(height = 1) {
				text(font = "Impact", halign = "center", size = 20, text = "H", valign = "center");
			}
		}
	}
}