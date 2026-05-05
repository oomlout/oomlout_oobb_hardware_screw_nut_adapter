$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -3.0]) {
			cylinder(h = 3, r1 = 4.925, r2 = 5.075);
		}
		linear_extrude(height = 2) {
			text(font = "Impact", halign = "center", size = 12, text = "6", valign = "center");
		}
	}
	union();
}
