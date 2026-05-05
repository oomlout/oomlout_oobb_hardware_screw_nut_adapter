$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -3.0]) {
			cylinder(h = 3, r1 = 6.175, r2 = 6.325);
		}
		linear_extrude(height = 2) {
			text(font = "Impact", halign = "center", size = 12, text = "M", valign = "center");
		}
	}
	union();
}
