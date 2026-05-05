$fn = 50;

difference() {
	union() {
		translate(v = [0, 0, -3.0]) {
			cylinder(h = 3, r1 = 4.925, r2 = 5.075);
		}
		linear_extrude(height = 2) {
			text(font = "Wingdings", halign = "center", size = 9, text = "J", valign = "center");
		}
	}
	union();
}
