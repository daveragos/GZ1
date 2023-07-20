import 'package:game_zoning/Bar_Graph/individual_income.dart';

class BarData {
  final double dstvAmount;
  final double poolAmount;
  final double vrAmount;
  final double coffeeAmount;
  final double psAmount;
  final double bettingAmount;

  BarData({
    required this.bettingAmount,
    required this.coffeeAmount,
    required this.dstvAmount,
    required this.poolAmount,
    required this.psAmount,
    required this.vrAmount,
  });

  List<IndividualBar> barData = [];

  //initialize bardata

  void initializeBarData() {
    barData = [
      IndividualBar(
        x: 0,
        y: bettingAmount,
      ),
      IndividualBar(
        x: 1,
        y: coffeeAmount,
      ),
      IndividualBar(
        x: 2,
        y: dstvAmount,
      ),
      IndividualBar(
        x: 3,
        y: poolAmount,
      ),
      IndividualBar(
        x: 4,
        y: psAmount,
      ),
      IndividualBar(
        x: 5,
        y: vrAmount,
      ),
    ];
  }
}
