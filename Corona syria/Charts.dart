import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Charts extends StatefulWidget {
  List data;
  String type;
  Charts(this.data, this.type);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  double tz = 0;
  @override
  void initState() {
    tz = (widget.data[8] - widget.data[7])/widget.data[7];
    tz = tz*100;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        // isTransposed: true,

        primaryXAxis: CategoryAxis(),

        // Chart title
        title: ChartTitle(
            text: 'حالات ' + widget.type + ' لآخر تسع ايام ',
            textStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'Qu',
            )),
        // Enable legend
        // legend: Legend(isVisible: true),
        // Enable tooltip
        enableAxisAnimation: true,
        legend: Legend(
          // toggleSeriesVisibility: true,
          isVisible: true,
          position: LegendPosition.bottom,
          textStyle: TextStyle(height: 2 , color: Colors.white , shadows: [
            Shadow(
              blurRadius: 10.0,
              color: Colors.black,
              offset: Offset(6.0, 6.0),
            ),
          ],)
          // Legend title
          // title: LegendTitle(text: "how are you")
        ),
        tooltipBehavior: TooltipBehavior(
            enable: true,
            color: Color(0xFF2d3436),
            animationDuration: 500,
            header: "عدد الحالات",
            textStyle: TextStyle(
              fontFamily: 'Qu',
            ),
            elevation: 30,
            shadowColor: Colors.black,
            opacity: 1),
        series: <ChartSeries<_SalesData, String>>[
          tz>= 0 ? SplineSeries<_SalesData, String>(
              name:  "+"+tz.toStringAsFixed(1) + "%   نسبة تزايد حالات "+widget.type,
              width: 5,
              legendIconType: LegendIconType.triangle,
              dataSource: <_SalesData>[
                _SalesData('D1', widget.data[0]),
                _SalesData('D2', widget.data[1]),
                _SalesData('D3', widget.data[2]),
                _SalesData('D4', widget.data[3]),
                _SalesData('D5', widget.data[4]),
                _SalesData('D6', widget.data[5]),
                _SalesData('D7', widget.data[6]),
                _SalesData('امس', widget.data[7]),
                _SalesData('اليوم', widget.data[8])
              ],
              xValueMapper: (_SalesData sales, _) => sales.day,
              yValueMapper: (_SalesData sales, _) => sales.val,
              color: Colors.white,
              animationDuration: 1500,
              markerSettings:
                  MarkerSettings(borderColor: Colors.black, isVisible: true),
              // legendItemText: "mohamad",
              dashArray: <double>[6, 6],
              // Enable data label
              dataLabelSettings: DataLabelSettings(
                  angle: -9,
                  alignment: ChartAlignment.far,
                  margin: EdgeInsets.all(4),
                  isVisible: true,
                  color: Colors.black.withOpacity(0.9),
                  opacity: 0.7,
                  showCumulativeValues: true))
              : SplineSeries<_SalesData, String>(
              name:  tz.toStringAsFixed(1) + "%   نسبة تزايد حالات "+widget.type,
              width: 5,
              legendIconType: LegendIconType.invertedTriangle,
              dataSource: <_SalesData>[
                _SalesData('D1', widget.data[0]),
                _SalesData('D2', widget.data[1]),
                _SalesData('D3', widget.data[2]),
                _SalesData('D4', widget.data[3]),
                _SalesData('D5', widget.data[4]),
                _SalesData('D6', widget.data[5]),
                _SalesData('D7', widget.data[6]),
                _SalesData('امس', widget.data[7]),
                _SalesData('اليوم', widget.data[8])
              ],
              xValueMapper: (_SalesData sales, _) => sales.day,
              yValueMapper: (_SalesData sales, _) => sales.val,
              color: Colors.white,
              animationDuration: 1500,
              markerSettings:
              MarkerSettings(borderColor: Colors.black, isVisible: true),
              // legendItemText: "mohamad",
              dashArray: <double>[6, 6],
              // Enable data label
              dataLabelSettings: DataLabelSettings(
                  angle: -9,
                  alignment: ChartAlignment.far,
                  margin: EdgeInsets.all(4),
                  isVisible: true,
                  color: Colors.black.withOpacity(0.9),
                  opacity: 0.7,
                  showCumulativeValues: true))
        ]);
  }
}

class _SalesData {
  _SalesData(this.day, this.val);

  final String day;
  final int val;
}
