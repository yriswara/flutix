part of 'models.dart';

class Promo extends Equatable {
  final String title;
  final String subtitle;
  final int discount;

  Promo({@required this.title, this.discount, this.subtitle});

  @override
  List<Object> get props => [title, discount, subtitle];
}

List<Promo> dummyPromos = [
  Promo(
      title: "Student Holiday",
      discount: 50,
      subtitle: "Maximal only for two people"),
  Promo(
      title: "Family Club",
      discount: 70,
      subtitle: "Minimal for theree members"),
  Promo(title: "Subscription Promo", discount: 40, subtitle: "Min, one year")
];
