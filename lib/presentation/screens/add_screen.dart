import 'package:finance_app/presentation/widgets/add_form_container.dart';
import 'package:finance_app/presentation/widgets/background_container.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: color.background,
      body: const SafeArea(
        child: Stack(
          children: [
            BackgroundContainer(),
            FormContainer(),
          ],
        ),
      ),
    );
  }
}
