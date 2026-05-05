$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -5.0]) {
			cylinder(h = 5, r = 24.5);
		}
	}
	union() {
		#translate(v = [0, 0, -5.0]) {
			cylinder(h = 3, r1 = 22.575, r2 = 22.425);
		}
		translate(v = [0, 0, -1]) {
			linear_extrude(height = 1) {
				text(font = "Impact", halign = "center", size = 10, text = "M", valign = "center");
			}
		}
	}
}
