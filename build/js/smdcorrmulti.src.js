
// This file is an automatically generated and should not be edited

'use strict';

const options = [{"name":"data","type":"Data"},{"name":"vars","title":"Variables","type":"Variables","takeFromDataIfMissing":true,"suggested":["ordinal","continuous"],"permitted":["numeric"],"rejectInf":false},{"name":"dottype","title":"type","type":"List","options":["ring","dot"],"default":"ring"},{"name":"dotsize","title":"size (1-100)","type":"String","default":"30"},{"name":"jitter_perc","title":"jitter (0-100)","type":"String","default":"0"},{"name":"dotopac","title":"opacity (0-100)","type":"String","default":"100"},{"name":"spearman","title":"percentile ranks","type":"Bool","default":false},{"name":"upper","title":"Upper/Right plots","type":"List","options":["stats","data","neither"],"default":"data"},{"name":"lower","title":"Lower/Left plots","type":"List","options":["stats","data","neither"],"default":"neither"},{"name":"tint","title":"Color by strength of correlation","type":"Bool","default":false},{"name":"color1","title":"color (see bit.ly/rcolors)","type":"String","default":"gray28"},{"name":"tint2","title":"Separate color for negative values","type":"Bool","default":false},{"name":"color2","title":"color (see bit.ly/rcolors)","type":"String","default":"blue"},{"name":"lw","title":"Lines/Curves width (0-100)","type":"String","default":"25"},{"name":"fit","title":"Fits","type":"List","options":["none","line","curve","both"],"default":"line"},{"name":"smoothness","title":"Curve smoothness (1-100)","type":"String","default":"50"},{"name":"digits","title":"Statistics digits","type":"List","options":["2","3","4","5"],"default":"2"},{"name":"equateaxes","title":"Equate all axis ranges","type":"Bool","default":false},{"name":"axesmin","title":"x-axis minimum","type":"String","default":"auto"},{"name":"axesmax","title":"x-axis minimum","type":"String","default":"auto"},{"name":"graphtitle","title":"Title","type":"String","default":"auto"},{"name":"variablelabels","title":"Variable labels","type":"String","default":"auto"},{"name":"ticklabelsize","title":"Axis number size (1-100)","type":"String","default":"30"}];

const view = function() {
    
    this.handlers = { }

    View.extend({
        jus: "3.0",

        events: [

	]

    }).call(this);
}

view.layout = ui.extend({

    label: "Correlation for multiple measures",
    jus: "3.0",
    type: "root",
    stage: 0, //0 - release, 1 - development, 2 - proposed
    controls: [
		{
			type: DefaultControls.VariableSupplier,
			typeName: 'VariableSupplier',
			suggested: ["continuous","ordinal"],
			permitted: ["numeric"],
			persistentItems: false,
			stretchFactor: 1,
			controls: [
				{
					type: DefaultControls.TargetLayoutBox,
					typeName: 'TargetLayoutBox',
					controls: [
						{
							type: DefaultControls.VariablesListBox,
							typeName: 'VariablesListBox',
							name: "vars",
							isTarget: true
						}
					]
				}
			]
		},
		{
			type: DefaultControls.CollapseBox,
			typeName: 'CollapseBox',
			label: "Manage datapoint visibility",
			collapsed: true,
			stretchFactor: 1,
			controls: [
				{
					type: DefaultControls.LayoutBox,
					typeName: 'LayoutBox',
					margin: "large",
					controls: [
						{
							type: DefaultControls.Label,
							typeName: 'Label',
							label: "Adjust point..."
						},
						{
							type: DefaultControls.ComboBox,
							typeName: 'ComboBox',
							name: "dottype"
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "dotsize",
							label: "size (1-100)",
							format: FormatDef.string
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "jitter_perc",
							label: "jitter (0-100)",
							format: FormatDef.string
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "dotopac",
							label: "opacity (0-100)",
							format: FormatDef.string
						}
					]
				}
			]
		},
		{
			type: DefaultControls.CollapseBox,
			typeName: 'CollapseBox',
			label: "Transform data",
			collapsed: true,
			stretchFactor: 1,
			controls: [
				{
					type: DefaultControls.LayoutBox,
					typeName: 'LayoutBox',
					margin: "large",
					controls: [
						{
							type: DefaultControls.CheckBox,
							typeName: 'CheckBox',
							name: "spearman",
							label: "percentile ranks"
						}
					]
				}
			]
		},
		{
			type: DefaultControls.CollapseBox,
			typeName: 'CollapseBox',
			label: "Show stats/data/colors",
			collapsed: true,
			stretchFactor: 1,
			controls: [
				{
					type: DefaultControls.LayoutBox,
					typeName: 'LayoutBox',
					margin: "large",
					controls: [
						{
							type: DefaultControls.Label,
							typeName: 'Label',
							label: "Plot contents"
						},
						{
							type: DefaultControls.ComboBox,
							typeName: 'ComboBox',
							name: "upper"
						},
						{
							type: DefaultControls.ComboBox,
							typeName: 'ComboBox',
							name: "lower"
						},
						{
							type: DefaultControls.Label,
							typeName: 'Label',
							label: "Color tinting"
						},
						{
							type: DefaultControls.CheckBox,
							typeName: 'CheckBox',
							name: "tint",
							label: "Color by strength of correlation"
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "color1",
							format: FormatDef.string
						},
						{
							type: DefaultControls.CheckBox,
							typeName: 'CheckBox',
							name: "tint2",
							label: "Separate color for negative values"
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "color2",
							format: FormatDef.string
						}
					]
				}
			]
		},
		{
			type: DefaultControls.CollapseBox,
			typeName: 'CollapseBox',
			label: "Fit lines/curves",
			collapsed: true,
			stretchFactor: 1,
			controls: [
				{
					type: DefaultControls.LayoutBox,
					typeName: 'LayoutBox',
					margin: "large",
					controls: [
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "lw",
							label: "Line/curve widths (0-100)",
							format: FormatDef.string
						},
						{
							type: DefaultControls.ComboBox,
							typeName: 'ComboBox',
							name: "fit"
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "smoothness",
							label: "Curve smoothness (1-100)",
							format: FormatDef.string
						},
						{
							type: DefaultControls.ComboBox,
							typeName: 'ComboBox',
							name: "digits"
						}
					]
				}
			]
		},
		{
			type: DefaultControls.CollapseBox,
			typeName: 'CollapseBox',
			label: "Tweak axes",
			collapsed: true,
			stretchFactor: 1,
			controls: [
				{
					type: DefaultControls.LayoutBox,
					typeName: 'LayoutBox',
					margin: "large",
					controls: [
						{
							type: DefaultControls.CheckBox,
							typeName: 'CheckBox',
							name: "equateaxes",
							label: "Equate all axis ranges"
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "axesmin",
							format: FormatDef.string
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "axesmax",
							format: FormatDef.string
						}
					]
				}
			]
		},
		{
			type: DefaultControls.CollapseBox,
			typeName: 'CollapseBox',
			label: "Adjust labels & plot size",
			collapsed: true,
			stretchFactor: 1,
			controls: [
				{
					type: DefaultControls.LayoutBox,
					typeName: 'LayoutBox',
					margin: "large",
					controls: [
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "graphtitle",
							format: FormatDef.string
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "variablelabels",
							format: FormatDef.string
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "ticklabelsize",
							label: "Axis number size (1-100)",
							format: FormatDef.string
						}
					]
				}
			]
		}
	]
});

module.exports = { view : view, options: options };
