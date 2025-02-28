$fn = 50;


difference() {
	union() {
		translate(v = [0, 0, -3.0000000000]) {
			cylinder(h = 3, r1 = 4.9250000000, r2 = 5.0750000000);
		}
		translate(v = [0, -0.5000000000, 0]) {
			linear_extrude(height = 2) {
				text(font = "Webdings", halign = "center", size = 16, text = "Y", valign = "center");
			}
		}
	}
	union();
}