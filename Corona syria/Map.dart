import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import 'Data.dart';
import 'Model.dart';

class Map extends StatefulWidget {
  Data d;
  Map(this.d);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  List<Model> data;
  List new_inf;
  List inf;
  @override
  void initState() {
    inf = [
      widget.d.Damascuse,
      widget.d.RefD,
      widget.d.Raqa,
      widget.d.Hama,
      widget.d.Homs,
      widget.d.Halab,
      widget.d.Der,
      widget.d.Haska,
      widget.d.Tartous,
      widget.d.Daraa,
      widget.d.Sweda,
      widget.d.Edlib,
      widget.d.Latakia,
      widget.d.Qunetra
    ];
    new_inf = [
      widget.d.NDamascuse,
      widget.d.NRefD,
      widget.d.NRaqa,
      widget.d.NHama,
      widget.d.NHoms,
      widget.d.NHalab,
      widget.d.NDer,
      widget.d.NHaska,
      widget.d.NTartous,
      widget.d.NDaraa,
      widget.d.NSweda,
      widget.d.NEdlib,
      widget.d.NLatakia,
      widget.d.NQunetra
    ];
    data = <Model>[
      Model('مدينة دمشق', Colors.red, 'دمشق'),
      Model('ريف دمشق', Colors.deepPurple, 'ريف دمشق'),
      Model('الرقة', Colors.deepPurple, 'الرقة'),
      Model('حماة', Colors.deepPurple, 'حماة'),
      Model('حمص', Colors.deepPurple, 'حمص'),
      Model('حلب', Colors.deepPurple, 'حلب'),
      Model('دير الزور', Colors.deepPurple, 'دير الزور'),
      Model('الحسكة', Colors.deepPurple, 'الحسكة'),
      Model('طرطوس', Colors.deepPurple, 'طرطوس'),
      Model('درعا', Colors.deepPurple, 'درعا'),
      Model('السويداء', Colors.deepPurple, 'السويداء'),
      Model('إدلب', Colors.deepPurple, 'إدلب'),
      Model('اللاذقية', Colors.deepPurple, 'اللاذقية'),
      Model('القنيطرة', Colors.deepPurple, 'القنيطرة'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      // color: Colors.red,
      child: SfMaps(
        title: const MapTitle(
            text: 'توَّزع الإصابات',
            textStyle: TextStyle(
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.deepPurple,
                    offset: Offset(3.0, 3.0),
                  ),
                ],
                fontFamily: "Qu",
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        layers: <MapShapeLayer>[
          MapShapeLayer(
            delegate: MapShapeLayerDelegate(

              shapeFile: 'maps/syria.json',
              shapeDataField: 'NAME_ARA',
              dataCount: data.length,
              primaryValueMapper: (int index) => data[index].state,
              dataLabelMapper: (int index) => data[index].stateCode,
              shapeColorValueMapper: (int index) => data[index].color,
              shapeTooltipTextMapper: (int index) => inf[index]+"  |  +"+new_inf[index]+" New",
            ),
            color: Colors.black,

            // enableSelection: true,
            zoomPanBehavior: MapZoomPanBehavior(
                enablePanning: true,
                enablePinching: true,
                showToolbar: true,
                toolbarSettings: MapToolbarSettings(iconColor: Colors.red)),
            showDataLabels: true,
            enableBubbleTooltip: true,
            enableSelection: true,
            selectionSettings: MapSelectionSettings(color: Colors.red),
            // showBubbles: true,
            enableShapeTooltip: true,
            tooltipSettings: MapTooltipSettings(
                color: Colors.black.withOpacity(0.6),
textStyle: TextStyle(fontFamily: "Anto",),
                // strokeColor: Colors.red,
                strokeWidth: 2),
            strokeColor: Colors.white,
            strokeWidth: 0.9,
            dataLabelSettings: MapDataLabelSettings(
                textStyle: TextStyle(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.black,
                        offset: Offset(8.0, 8.0),
                      ),
                    ],
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.caption.fontSize)),
          ),
        ],
      ),
    );
  }
}
