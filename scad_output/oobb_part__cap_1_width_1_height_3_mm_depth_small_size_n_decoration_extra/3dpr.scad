$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -3.0000000000]) {
			cylinder(h = 3, r1 = 4.9250000000, r2 = 5.0750000000);
		}
		linear_extrude(height = 2) {
			text(font = "Impact", halign = "center", size = 12, text = "N", valign = "center");
		}
	}
	union();
}