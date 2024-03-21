import 'package:finance_app/core/models/add_data_model.dart';
import 'package:hive/hive.dart';

int totals = 0;

final box = Hive.box<AddNewData>('data');

int total() {
  var secondHistory = box.values.toList();
 List newList = [0, 0];
  for (var i = 0; i < secondHistory.length; i++) {
    newList.add(secondHistory[i].type == 'Income'
        ? int.parse(secondHistory[i].amount)
        : int.parse(secondHistory[i].amount) * -1);
  }
  totals = newList.reduce((value, element) => value + element);
  return totals;
}

int incomes() {
  var secondHistory = box.values.toList();
  List newList = [0, 0];
  for (var i = 0; i < secondHistory.length; i++) {
    newList.add(secondHistory[i].type == 'Income'
        ? int.parse(secondHistory[i].amount)
        : 0);
  }
  totals = newList.reduce((value, element) => value + element);
  return totals;
}

int expenses() {
  var secondHistory = box.values.toList();
  List newList = [0, 0];
  for (var i = 0; i < secondHistory.length; i++) {
    newList.add(secondHistory[i].type == 'Income'
        ? 0
        : int.parse(secondHistory[i].amount) * -1);
  }
  totals = newList.reduce((value, element) => value + element);
  return totals;
}

List<AddNewData> today() {
  List<AddNewData> newList = [];
  var secondHistory = box.values.toList();
  DateTime date = DateTime.now();
  for (var i = 0; i < secondHistory.length; i++) {
    if (secondHistory[i].datetime.day == date.day) {
      newList.add(secondHistory[i]);
    }
  }
  return newList;
}

List<AddNewData> week() {
  List<AddNewData> newList = [];
  var secondHistory = box.values.toList();
  DateTime date = DateTime.now();
  for (var i = 0; i < secondHistory.length; i++) {
    if (date.day - 7 <= secondHistory[i].datetime.day &&
        secondHistory[i].datetime.day <= date.day) {
      newList.add(secondHistory[i]);
    }
  }
  return newList;
}

List<AddNewData> month() {
  List<AddNewData> newList = [];
  var secondHistory = box.values.toList();
  DateTime date = DateTime.now();
  for (var i = 0; i < secondHistory.length; i++) {
    if (secondHistory[i].datetime.month == date.month) {
      newList.add(secondHistory[i]);
    }
  }
  return newList;
}

List<AddNewData> year() {
  List<AddNewData> newList = [];
  var secondHistory = box.values.toList();
  DateTime date = DateTime.now();
  for (var i = 0; i < secondHistory.length; i++) {
    if (secondHistory[i].datetime.year == date.year) {
      newList.add(secondHistory[i]);
    }
  }
  return newList;
}

int totalChart(List<AddNewData> secondHistory) {
  List a = [];

  for (var i = 0; i < secondHistory.length; i++) {
    a.add(secondHistory[i].type == 'Income'
        ? int.parse(secondHistory[i].amount)
        : int.parse(secondHistory[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List time(List<AddNewData> secondHistory, bool hour) {
  List<AddNewData> a = [];
  List total = [];
  var counter = 0;
  for (var c = 0; c < secondHistory.length; c++) {
    for (var i = c; i < secondHistory.length; i++) {
      if (hour) {
        if (secondHistory[i].datetime.hour == secondHistory[c].datetime.hour) {
          a.add(secondHistory[i]);
          counter = i;
        }
      } else {
        if (secondHistory[i].datetime.day == secondHistory[c].datetime.day) {
          a.add(secondHistory[i]);
          counter = i;
        }
      }
    }
    total.add(totalChart(List.from(a)));
    a.clear();
    c = counter;
  }

  return total;
}
