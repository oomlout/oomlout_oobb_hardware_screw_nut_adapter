$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -5.0000000000]) {
			cylinder(h = 5, r = 17.0000000000);
		}
	}
	union() {
		#translate(v = [0, 0, -5.0000000000]) {
			cylinder(h = 3, r1 = 15.0750000000, r2 = 14.9250000000);
		}
		translate(v = [0, -0.5000000000, -1]) {
			linear_extrude(height = 1) {
				text(font = "Webdings", halign = "center", size = 11, text = "Y", valign = "center");
			}
		}
	}
}