import 'package:hive/hive.dart';
part 'add_data_model.g.dart';


@HiveType(typeId: 1)
class AddNewData extends HiveObject {
  @HiveField(0)
  String category;
  @HiveField(1)
  String description;
  @HiveField(2)
  String amount;
  @HiveField(3)
  String type;
  @HiveField(4)
  DateTime datetime;


  AddNewData(
    this.category,
    this.description,
    this.amount,
    this.type,
    this.datetime,
  );
}
