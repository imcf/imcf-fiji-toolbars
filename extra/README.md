# Supplementary material for Fiji

This directory contains additional scripts and stuff that can't or shouldn't be
packaged in the `.jar` file by Maven but is rather meant to be run manually or
copied over to a specific location inside a Fiji installation.

## Auto-Run Setup

To enable the *auto-run* feature of the IMCF Toolbar, the `Show_IMCF_Toolbar.js`
script needs to be put at the corresponding location in your Fiji installation.

```text
plugins/
└── Scripts
    └── Plugins
        └── AutoRun
            └── Show_IMCF_Toolbar.js
```

## Rendering LUT previews

The script [`Render_LUTs.ijm`](scripts/Render_LUTs.ijm) can be used to generate
`PNG` previews of all available LUTs in a Fiji installation. Simply open it with
the Script Editor and hit the `Run` button. A dialog will show up allowing you
to adjust all desired settings like size, output location etc.
