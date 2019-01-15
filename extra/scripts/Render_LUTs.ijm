// @File(label="Output directory", description="Output directory for rendered LUTs", style="directory") outdir
// @Integer(label="Width", description="Width of rendered LUTs", value=128) dim_x
// @Integer(label="Height", description="Height of rendered LUTs", value=24) dim_y
// @Integer(label="HiLo Offset", description="Size of Hi/Lo markers", value=6) offset
// @Integer(label="Nr. of buttons", description="Number of buttons to put in one line", value=8) buttons_per_line

setBatchMode(true);
processLUTs(outdir, dim_x, dim_y, offset, buttons_per_line);
setBatchMode(false);

function processLUTs(outdir, dim_x, dim_y, offset, buttons_per_line) {
	bar_file = outdir + "/All_LUTs_Popup.bar";
	header  = "";
	header += "//  >>>> !!! AUTO-GENERATED  -  DO NOT EDIT !!! <<<<\n\n";
	header += "// This Action Bar description file is meant for being included in a .jar file\n";
	header += "// and thus has no ImageJ macro language section, instead the call to launch it\n";
	header += "// is in the corresponding macro file included in the .jar.\n";
	header += "\n\n";
	header += "<popup>\n\n";
	header += "// -------- line --------\n\n";
	header += "<line>\n\n";
	button_count = 1;
	File.saveString(header, bar_file);  // will overwrite an existing file!

	lut_list = getList("LUTs");
	// lut_list = Array.sort(lut_list);
	for (i = 0; i < lut_list.length; i++) {
		icon_name = renderPNGfromLUT(outdir, lut_list[i], dim_x, dim_y, offset);
		genActionBarButton(bar_file, lut_list[i], icon_name);
		if ((button_count % buttons_per_line) == 0 && i < (lut_list.length -1)) {
			newActionBarLine(bar_file);
		}
		button_count++;
	}

	footer = "</line>\n\n";
	File.append(footer, bar_file);
}

function renderPNGfromLUT(outdir, lut_name, dim_x, dim_y, offset) {
	// lut_name = substring(file, 0, lastIndexOf(file ,".lut"));
	icon_name = replace(lut_name, " ", "_");
	icon_name = replace(icon_name, "/", "__");
	print("'" + lut_name + "'  --  '" + icon_name + "'");

	// generate raw / original LUTs:
	newImage(icon_name, "8-bit ramp", dim_x, dim_y, 1);
	run(lut_name);
	saveAs("PNG", outdir + "/" + icon_name);
	close();

	// generate LUT variants with emphasized minima and maxima (HiLo):
	newImage(icon_name, "8-bit ramp", dim_x, dim_y, 1);
	setBackgroundColor(255, 255, 255);
	makeRectangle(dim_x - offset, 0, offset, dim_y);
	run("Clear", "slice");
	setBackgroundColor(0, 0, 0);
	makeRectangle(0, 0, offset, dim_y);
	run("Clear", "slice");
	run(lut_name);
	saveAs("PNG", outdir + "/" + icon_name + "-HiLo");
	close();

	return icon_name;
}

function genActionBarButton(ab_file, lut_name, icon_name) {
	code = "";
	code += "<button>\n";
	code += "label=" + lut_name + "\n";
	code += "icon=icons/lut/" + icon_name + ".png\n";
	code += "arg=<macro>\n";
	code += "run(\"" + lut_name + "\")\n";
	code += "</macro>\n";
	File.append(code, ab_file);
}

function newActionBarLine(ab_file) {
	code = "";
	code += "</line>\n\n";
	code += "// -------- line --------\n\n";
	code += "<line>\n";
	File.append(code, ab_file);
}
