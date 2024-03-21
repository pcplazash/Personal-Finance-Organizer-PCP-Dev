

import 'barrel.dart';

class FormContainer extends StatefulWidget {
  const FormContainer({Key? key}) : super(key: key);

  @override
  State<FormContainer> createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final FocusNode descriptionFocusNode = FocusNode();
  final FocusNode amountFocusNode = FocusNode();
  String? selectedItem;
  String? selectedSecondItem;
  DateTime date = DateTime.now();
  final box = Hive.box<AddNewData>('data');

  @override
  void initState() {
    super.initState();
    descriptionFocusNode.addListener(() {
      setState(() {});
    });
    amountFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      top: height * 0.16,
      left: (width - height * 0.4) / 2,
      child: Container(
        height: height * 0.72,
        width: height * 0.4,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(2, 2),
                blurRadius: 1,
                spreadRadius: 1),
          ],
          color: color.secondaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                'Add Income or Expense',
                style: subTitleFontStyle(context, Colors.black87),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    CategoryBox(
                      selectedItem: selectedItem,
                      hintText: 'Category',
                      items: const [
                        'food',
                        'transfer',
                        'transportation',
                        'education',
                        'other'
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedItem = value;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    TextFieldBox(
                      hintText: 'Amount',
                      textEditingController: amountController,
                      focusNode: amountFocusNode,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an amount.';
                        }
                        if (value.contains('.')) {
                          return 'Please enter a number without decimals.';
                        }

                        final n = num.tryParse(value);
                        if (n == null) {
                          return '"$value" is not a valid number.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    CategoryBox(
                      selectedItem: selectedSecondItem,
                      items: const ['Income', 'Expense'],
                      hintText: 'Type',
                      onChanged: (value) {
                        setState(() {
                          selectedSecondItem = value;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    DateTimeBox(
                      showDate: 'Date: ${date.year}/${date.month}/${date.day} ',
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(2022),
                            lastDate: DateTime(2030));
                        if (newDate == null) return;
                        setState(() {
                          date = newDate;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    TextFieldBox(
                      maxLength: 30,
                      hintText: 'Description',
                      textEditingController: descriptionController,
                      focusNode: descriptionFocusNode,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 3) {
                          return 'At least 3 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),
                    SaveButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var add = AddNewData(
                            selectedItem!,
                            descriptionController.text,
                            amountController.text,
                            selectedSecondItem!,
                            date,
                          );
                          box.add(add);

                          Navigator.pop(context);
                        }
                      },
                    ),
                    const SizedBox(height: 40)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
