import 'package:finance_app/presentation/widgets/barrel.dart';

class Chart extends StatefulWidget {
  final int newIndex;
  final String timeAxis;

  const Chart({
    super.key,
    required this.newIndex,
    required this.timeAxis,
  });

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<AddNewData>? a;
  bool b = true;
  bool j = true;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    switch (widget.newIndex) {
      case 0:
        a = today();
        b = true;
        j = true;
        break;
      case 1:
        a = week();
        b = false;
        j = true;
        break;
      case 2:
        a = month();
        b = false;
        j = true;
        break;
      case 3:
        a = year();

        j = false;
        break;
      default:
    }
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        plotAreaBackgroundColor: color.primaryContainer,
        title: ChartTitle(
          text: 'Your money behavior through the time',
          textStyle: smallFontStyle(context, color.outline),
        ),
        primaryXAxis: CategoryAxis(
          title: AxisTitle(
            text: widget.timeAxis,
            textStyle: buttonFontStyle(
              context,
              color.outline,
            ),
          ),
        ),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            color: color.primary,
            width: 4,
            dataSource: <SalesData>[
              ...List.generate(time(a!, b ? true : false).length, (index) {
                return SalesData(
                    j
                        ? b
                            ? a![index].datetime.hour.toString()
                            : a![index].datetime.day.toString()
                        : a![index].datetime.month.toString(),
                    b
                        ? index > 0
                            ? time(a!, true)[index] + time(a!, true)[index - 1]
                            : time(a!, true)[index]
                        : index > 0
                            ? time(a!, false)[index] +
                                time(a!, false)[index - 1]
                            : time(a!, false)[index]);
              })
            ]..sort((a, b) => a.year.compareTo(b.year)),
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          )
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final int sales;
}
