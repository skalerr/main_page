import 'package:flutter/material.dart';

class CardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Align(
        alignment: Alignment.center,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _calculateCrossAxisCount(context),
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: CardItem(
                title: 'Карточка ${index + 1}',
                subtitle: 'Описание карточки ${index + 1}',
              ),
            );
          },
          itemCount: 9,
        ),
      ),
    );
  }

  int _calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 200).floor();
    return crossAxisCount > 1 ? crossAxisCount : 1;
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const CardItem({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 120.0,
        height: 120.0,
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.card_giftcard, size: 32.0),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.0),
            Text(
              subtitle,
              style: TextStyle(fontSize: 14.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
