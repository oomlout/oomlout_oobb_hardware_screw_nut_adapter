$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -3.0000000000]) {
			cylinder(h = 3, r1 = 6.1750000000, r2 = 6.3250000000);
		}
		linear_extrude(height = 2) {
			text(font = "Impact", halign = "center", size = 12, text = "7", valign = "center");
		}
	}
	union();
}