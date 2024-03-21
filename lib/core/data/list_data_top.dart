import '../models/data_model.dart';

List<Money> getterTop() {
  Money snapFood = Money();
  snapFood.name = 'snap fad';
  snapFood.fee = '234';
  snapFood.time = 'jan22';
  snapFood.image = 'Food.png';
  snapFood.buy = false;
  Money snap = Money();
  snap.buy = true;
  snap.fee = '\$ 55';
  snap.image = 'Transfer.png';
  snap.name = 'transfer';
  snap.time = 'feb3';

  return [snapFood, snap];
}
