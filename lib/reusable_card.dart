import 'package:flutter/widgets.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  ReusableCard(this.color, this.cardChild);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      margin: EdgeInsetsDirectional.all(15),
    );
  }
}
