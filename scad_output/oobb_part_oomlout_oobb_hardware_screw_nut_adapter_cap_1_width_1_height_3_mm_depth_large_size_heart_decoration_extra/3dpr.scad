$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -3.0000000000]) {
			cylinder(h = 3, r1 = 6.1750000000, r2 = 6.3250000000);
		}
		translate(v = [0, -0.5000000000, 0]) {
			linear_extrude(height = 2) {
				text(font = "Webdings", halign = "center", size = 16, text = "Y", valign = "center");
			}
		}
	}
	union();
}