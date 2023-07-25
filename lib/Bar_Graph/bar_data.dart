import 'package:game_zoning/Bar_Graph/individual_income.dart';

class BarData {
  double? bettingAmount;
  double? coffeeAmount;
  double? dstvAmount;
  double? poolAmount;
  double? psAmount;
  double? vrAmount;
  BarData({
    this.bettingAmount,
    this.coffeeAmount,
    this.dstvAmount,
    this.poolAmount,
    this.psAmount,
    this.vrAmount,
  });

  //initialize bardata

  void initializeBarData() {
    bettingAmount ??= 0.0;
    coffeeAmount ??= 0.0;
    dstvAmount ??= 0.0;
    poolAmount ??= 0.0;
    psAmount ??= 0.0;
    vrAmount ??= 0.0;

    barData = [
      IndividualBar(
        x: 0,
        y: bettingAmount!,
      ),
      IndividualBar(
        x: 1,
        y: coffeeAmount!,
      ),
      IndividualBar(
        x: 2,
        y: dstvAmount!,
      ),
      IndividualBar(
        x: 3,
        y: poolAmount!,
      ),
      IndividualBar(
        x: 4,
        y: psAmount!,
      ),
      IndividualBar(
        x: 5,
        y: vrAmount!,
      ),
    ];
  }

  List<IndividualBar> barData = [];
}
