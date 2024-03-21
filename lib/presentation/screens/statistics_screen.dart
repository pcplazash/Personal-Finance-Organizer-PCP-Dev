import 'package:finance_app/presentation/screens/screens_barrel.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List <String> filter = ['Day', 'Week', 'Month', 'Year'];
  List dateList = [
    today(),
    week(),
    month(),
    year(),
  ];
  List<AddNewData> newList = [];
  ValueNotifier statisticsValueNotifier = ValueNotifier(0);

  int indexColor = 0;
  bool isAscending = true;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final List<String> day = [
      'Monday',
      "Tuesday",
      "Wednesday",
      "Thursday",
      'friday',
      'saturday',
      'sunday'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Statistics',
          style: titleFontStyle(context, color.outline),
        ),
        backgroundColor: color.primary.withOpacity(0.7),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.primary.withOpacity(0.3),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back,
              color: color.outline,
              size: 24,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: statisticsValueNotifier,
            builder: (context, value, child) {
              newList = dateList[value];

              String timeAxis;
              String statisticsHeader;
              if (indexColor == 0) {
                timeAxis = 'Time (hours)';
                statisticsHeader = 'Today\'s transactions';
              } else if (indexColor == 1) {
                timeAxis = 'Time (days)';
                statisticsHeader = 'This week transactions';
              } else if (indexColor == 2) {
                timeAxis = 'Time (days)';
                statisticsHeader = 'Your month';
              } else {
                timeAxis = 'Time (months)';
                statisticsHeader = 'Your whole year';
              }

              return Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(4, (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    indexColor = index;
                                    statisticsValueNotifier.value = index;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: indexColor == index
                                        ? color.primary
                                        : color.background,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    filter[index],
                                    style: bodyFontStyle(
                                      context,
                                      indexColor == index
                                          ? Colors.white
                                          : color.outlineVariant,
                                    ),
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Chart(
                        newIndex: indexColor,
                        timeAxis: timeAxis,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              statisticsHeader,
                              style: bodyFontStyle(context, color.outline),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isAscending = !isAscending;
                                  sortList();
                                });
                              },
                              icon: Icon(
                                Icons.swap_vert,
                                color: color.tertiary,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/images/${newList[index].category}.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                title: Text(
                                  newList[index].category[0].toUpperCase() +
                                      newList[index].category.substring(1),
                                  style: bodyFontStyle(context, color.outline),
                                ),
                                subtitle: Text(
                                  '${day[newList[index].datetime.weekday - 1]}  ${newList[index].datetime.month}/${newList[index].datetime.day}/${newList[index].datetime.year}',
                                  style: smallFontStyle(context, color.outline),
                                ),
                                trailing: Text(newList[index].amount,
                                    style: smallFontStyle(
                                        context,
                                        newList[index].type != 'Income'
                                            ? color.tertiary
                                            : color.primary)),
                              );
                            },
                            childCount: newList.length,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }

  void sortList() {
    newList.sort((a, b) => isAscending
        ? a.datetime.compareTo(b.datetime)
        : b.datetime.compareTo(a.datetime));
  }
}
