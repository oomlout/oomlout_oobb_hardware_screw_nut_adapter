$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -3.0]) {
			cylinder(h = 3, r1 = 6.175, r2 = 6.325);
		}
		translate(v = [0, -0.5, 0]) {
			linear_extrude(height = 2) {
				text(font = "Webdings", halign = "center", size = 16, text = "Y", valign = "center");
			}
		}
	}
	union();
}
