$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -3.0000000000]) {
			cylinder(h = 3, r1 = 6.1750000000, r2 = 6.3250000000);
		}
		linear_extrude(height = 2) {
			text(font = "Webdings", halign = "center", size = 15, text = "b", valign = "center");
		}
	}
	union();
}