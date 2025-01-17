# Supplementary material for Fiji

This directory contains additional scripts and stuff that can't or shouldn't be
packaged in the `.jar` file by Maven but is rather meant to be run manually or
copied over to a specific location inside a Fiji installation.

## Rendering LUT previews

The script [`Render_LUTs.ijm`](scripts/Render_LUTs.ijm) can be used to generate
`PNG` previews of all available LUTs in a Fiji installation. Simply open it with
the Script Editor and hit the `Run` button. A dialog will show up allowing you
to adjust all desired settings like size, output location etc.
