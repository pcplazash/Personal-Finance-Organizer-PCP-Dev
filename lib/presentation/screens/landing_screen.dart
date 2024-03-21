import 'package:finance_app/presentation/screens/screens_barrel.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      body: const HomeScreen(),
      floatingActionButton: SpeedDial(
        overlayColor: Colors.grey,
        overlayOpacity: 0.2,
        backgroundColor: color.primary,
        foregroundColor: Colors.white,
        animatedIcon: AnimatedIcons.menu_close,
        spaceBetweenChildren: 12,
        spacing: 12,
        children: [
          SpeedDialChild(
              backgroundColor: color.primary,
              shape: const CircleBorder(),
              child: const Icon(Icons.add_circle_outline_outlined,
                  color: Colors.white),
              label: 'Add Income or Expense',
              labelStyle: buttonFontStyle(context, color.outline),
              labelBackgroundColor: color.background,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddScreen(),
                    ));
              }),
          SpeedDialChild(
              shape: const CircleBorder(),
              backgroundColor: color.primary,
              child: const Icon(
                Icons.bar_chart,
                color: Colors.white,
              ),
              label: 'Statistics',
              labelStyle: buttonFontStyle(context, color.outline),
              labelBackgroundColor: color.background,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Statistics(),
                    ));
              })
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
