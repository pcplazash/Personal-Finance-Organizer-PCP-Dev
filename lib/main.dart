import 'main_barrel.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AddNewDataAdapter());
  await Hive.openBox<AddNewData>('data');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorThemeCubit>(
          create: (context) => ColorThemeCubit(),
        ),
      ],
      child: const FinanceApp(),
    );
  }
}
