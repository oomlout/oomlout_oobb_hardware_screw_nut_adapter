$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -5.0]) {
			cylinder(h = 5, r = 14.5);
		}
	}
	union() {
		#translate(v = [0, 0, -5.0]) {
			cylinder(h = 3, r1 = 12.575, r2 = 12.425);
		}
		translate(v = [0, 0, -1]) {
			linear_extrude(height = 1) {
				text(font = "Webdings", halign = "center", size = 11, text = "b", valign = "center");
			}
		}
	}
}
