$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -5.0000000000]) {
			cylinder(h = 5, r = 24.5000000000);
		}
	}
	union() {
		#translate(v = [0, 0, -5.0000000000]) {
			cylinder(h = 3, r1 = 22.5750000000, r2 = 22.4250000000);
		}
		translate(v = [0, 0, -1]) {
			linear_extrude(height = 1) {
				text(font = "Wingdings", halign = "center", size = 11, text = "|", valign = "center");
			}
		}
	}
}