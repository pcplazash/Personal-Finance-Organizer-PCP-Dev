import 'package:finance_app/presentation/screens/screens_barrel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AddNewData history;
  final box = Hive.box<AddNewData>('data');
  final List<String> day = [
    'Monday',
    "Tuesday",
    "Wednesday",
    "Thursday",
    'friday',
    'saturday',
    'sunday'
  ];

  int currentState = 2;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: box.listenable(),
            builder: (context, value, child) {
              List<AddNewData> filteredList = box.values.toList();
              if (currentState == 0) {
                filteredList = filteredList
                    .where((item) => item.type == 'Income')
                    .toList();
              } else if (currentState == 1) {
                filteredList = filteredList
                    .where((item) => item.type == 'Expense')
                    .toList();
              }
              return Column(
                children: [
                  SizedBox(
                      height: height * 0.375, child: const HomeScreenHeader(),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Transactions',
                          style: bodyFontStyle(context, color.outline),
                        ),
                        Column(
                          children: [
                            Text(
                              'Show',
                              style:
                                  smallFontStyle(context, color.outlineVariant),
                            ),
                            FilterButton(
                              onPressed: () {
                                setState(() {
                                  currentState = (currentState + 1) % 3;
                                });
                              },
                              buttonText: currentState == 2
                                  ? 'All'
                                  : currentState == 0
                                      ? 'Incomes'
                                      : 'Expenses',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              if (index >= filteredList.length) return null;
                              final history = filteredList[index];
                              return Dismissible(
                                key: UniqueKey(),
                                onDismissed: (direction) {
                                  history.delete();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Item deleted',
                                        style: bodyFontStyle(
                                            context, color.secondary),
                                      ),
                                      duration: const Duration(seconds: 5),
                                      backgroundColor: color.primaryContainer,
                                    ),
                                  );
                                },
                                confirmDismiss:
                                    (DismissDirection direction) async {
                                  return await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const DismissAlertDialog();
                                    },
                                  );
                                },
                                child: InkWell(
                                  onTap: () async {
                                    return await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return InfoAlertDialog(
                                          category: history.category[0]
                                                  .toUpperCase() +
                                              history.category.substring(1),
                                          description: history.description,
                                          amount: history.amount,
                                          type: history.type,
                                          date:
                                              '${day[history.datetime.weekday - 1]}  ${history.datetime.month}/${history.datetime.day}/${history.datetime.year}',
                                        );
                                      },
                                    );
                                  },
                                  child: ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/${history.category}.png',
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                    title: Text(
                                      history.category[0].toUpperCase() +
                                          history.category.substring(1),
                                      style:
                                          bodyFontStyle(context, color.outline)
                                              .copyWith(),
                                    ),
                                    subtitle: Text(
                                      '${day[history.datetime.weekday - 1]}  ${history.datetime.month}/${history.datetime.day}/${history.datetime.year}',
                                      style: smallFontStyle(
                                          context, color.outline),
                                    ),
                                    trailing: Text(history.amount,
                                        style: buttonFontStyle(
                                            context,
                                            history.type != 'Income'
                                                ? color.tertiary.withRed(180)
                                                : color.primary
                                                    .withGreen(180))),
                                  ),
                                ),
                              );
                            },
                            childCount: filteredList.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.08,
                  )
                ],
              );
            }),
      ),
    );
  }
}
