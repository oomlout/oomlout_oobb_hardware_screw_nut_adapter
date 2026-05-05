$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -5.0]) {
			cylinder(h = 5, r = 32.0);
		}
	}
	union() {
		#translate(v = [0, 0, -5.0]) {
			cylinder(h = 3, r1 = 30.075, r2 = 29.925);
		}
		translate(v = [0, 0, -1]) {
			linear_extrude(height = 1) {
				text(font = "Wingdings", halign = "center", size = 11, text = "J", valign = "center");
			}
		}
	}
}
