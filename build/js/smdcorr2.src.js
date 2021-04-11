
// This file is an automatically generated and should not be edited

'use strict';

const options = [{"name":"data","type":"Data"},{"name":"dep","title":"Dependent Variable","type":"Variable"},{"name":"ind","title":"Independent Variable","type":"Variable"},{"name":"dottype","title":"type","type":"List","options":["ring","dot"],"default":"ring"},{"name":"color_dot","title":"color (see bit.ly/rcolors)","type":"String","default":"black"},{"name":"dotsize","title":"size (1-100)","type":"String","default":"30"},{"name":"xjitter","title":"x jitter (0-100)","type":"String","default":"0"},{"name":"yjitter","title":"y jitter (0-100)","type":"String","default":"0"},{"name":"dotopac","title":"opacity (0-100)","type":"String","default":"100"},{"name":"spearman","title":"percentile ranks","type":"Bool","default":false},{"name":"lw","title":"line/curve widths (0-100)","type":"String","default":"40"},{"name":"showresiduals","title":"show residuals","type":"Bool","default":false},{"name":"lsline","title":"line - least-squares","type":"Bool","default":true},{"name":"color1","title":"color (see bit.ly/rcolors)","type":"String","default":"black"},{"name":"polynomial","title":"curve - least-squares","type":"Bool","default":false},{"name":"color2","title":"color (see bit.ly/rcolors)","type":"String","default":"blue"},{"name":"polynomial_degree","title":"degree","type":"List","options":["2","3","4","5","6","7"],"default":"2"},{"name":"spline","title":"curve - spline","type":"Bool","default":false},{"name":"color3","title":"color (see bit.ly/rcolors)","type":"String","default":"red"},{"name":"spline_smoothness","title":"smoothness (1-100)","type":"String","default":"50"},{"name":"rug","title":"project data onto axes","type":"Bool","default":false},{"name":"xmin","title":"x-axis minimum","type":"String","default":"auto"},{"name":"xmax","title":"x-axis maximum","type":"String","default":"auto"},{"name":"ymin","title":"y-axis minimum","type":"String","default":"auto"},{"name":"ymax","title":"y-axis maximum","type":"String","default":"auto"},{"name":"showstats","title":"show stats on plot","type":"Bool","default":true},{"name":"graphtitle","title":"title","type":"String","default":"auto"},{"name":"xvariablelabel","title":"x variable label","type":"String","default":"auto"},{"name":"yvariablelabel","title":"y variable label","type":"String","default":"auto"}];

const view = function() {
    
    this.handlers = { }

    View.extend({
        jus: "3.0",

        events: [

	]

    }).call(this);
}

view.layout = ui.extend({

    label: "Correlation for 2 measures",
    jus: "3.0",
    type: "root",
    stage: 0, //0 - release, 1 - development, 2 - proposed
    controls: [
		{
			type: DefaultControls.VariableSupplier,
			typeName: 'VariableSupplier',
			persistentItems: false,
			stretchFactor: 1,
			controls: [
				{
					type: DefaultControls.TargetLayoutBox,
					typeName: 'TargetLayoutBox',
					label: "Dependent Variable",
					controls: [
						{
							type: DefaultControls.VariablesListBox,
							typeName: 'VariablesListBox',
							name: "dep",
							maxItemCount: 1,
							isTarget: true
						}
					]
				},
				{
					type: DefaultControls.TargetLayoutBox,
					typeName: 'TargetLayoutBox',
					label: "Independent Variable",
					controls: [
						{
							type: DefaultControls.VariablesListBox,
							typeName: 'VariablesListBox',
							name: "ind",
							maxItemCount: 1,
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
							name: "color_dot",
							format: FormatDef.string
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
							name: "xjitter",
							label: "x jitter (0-100)",
							format: FormatDef.string
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "yjitter",
							label: "y jitter (0-100)",
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
							label: "line/curve widths (0-100)",
							format: FormatDef.string
						},
						{
							type: DefaultControls.CheckBox,
							typeName: 'CheckBox',
							name: "showresiduals",
							label: "show residuals"
						},
						{
							type: DefaultControls.Label,
							typeName: 'Label',
							label: "Line - least-squares"
						},
						{
							type: DefaultControls.CheckBox,
							typeName: 'CheckBox',
							name: "lsline",
							label: "include"
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "color1",
							format: FormatDef.string
						},
						{
							type: DefaultControls.Label,
							typeName: 'Label',
							label: "Curve - least-squares"
						},
						{
							type: DefaultControls.CheckBox,
							typeName: 'CheckBox',
							name: "polynomial",
							label: "include"
						},
						{
							type: DefaultControls.ComboBox,
							typeName: 'ComboBox',
							name: "polynomial_degree"
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "color2",
							format: FormatDef.string
						},
						{
							type: DefaultControls.Label,
							typeName: 'Label',
							label: "Curve - spline"
						},
						{
							type: DefaultControls.CheckBox,
							typeName: 'CheckBox',
							name: "spline",
							label: "include"
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "color3",
							format: FormatDef.string
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "spline_smoothness",
							label: "smoothness (1-100)",
							format: FormatDef.string
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
							name: "rug",
							label: "project data onto axes"
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "xmin",
							format: FormatDef.string
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "xmax",
							format: FormatDef.string
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "ymin",
							format: FormatDef.string
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "ymax",
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
							type: DefaultControls.CheckBox,
							typeName: 'CheckBox',
							name: "showstats",
							label: "show stats on plot"
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "graphtitle",
							format: FormatDef.string
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "xvariablelabel",
							format: FormatDef.string
						},
						{
							type: DefaultControls.TextBox,
							typeName: 'TextBox',
							name: "yvariablelabel",
							format: FormatDef.string
						}
					]
				}
			]
		}
	]
});

module.exports = { view : view, options: options };
