import '../models/data_model.dart';

List<Money> getter() {
  Money upwork = Money();
  upwork.name = 'upwork';
  upwork.fee = '650';
  upwork.time = 'today';
  upwork.image = 'Transfer.png';
  upwork.buy = false;
  Money coffee = Money();
  coffee.buy = true;
  coffee.fee = '\$ 15';
  coffee.image = 'Food.png';
  coffee.name = 'cafe';
  coffee.time = 'today';
  Money transfer = Money();
  transfer.buy = true;
  transfer.fee = '100';
  transfer.image = 'Transfer.png';
  transfer.name = 'transfer to mom';
  transfer.time = 'yesterday';

  return [upwork, coffee, transfer];
}
