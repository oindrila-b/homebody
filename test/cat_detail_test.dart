
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homebody/models/model_pet_details.dart';
import 'package:homebody/screens/cat_page_list.dart';
import 'package:homebody/screens/dog_page_list.dart';
import 'package:homebody/screens/home.dart';

void main() {
  testWidgets('Cat Details Widget Test', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(home: CatPageList(cats: [
      PetDetails(
        id: 29,
        imagePath: 'images/esh_1.jpeg',
        name: 'Folly',
        age: '1 month',
        price: '28000',
        breed: 'Exotic Short-hair',
        isAdopted: false,
        species: Species.cat,
      ),
    ],)));

    expect(find.text("No Data Found"), findsNothing);
    expect(find.byKey(ValueKey("CatPageView")), findsAtLeastNWidgets(1));
  });

  testWidgets('Cat Detail Widget Test With Empty List', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(home: CatPageList(cats: [],)));

    expect(find.text("No Data Found"), findsOneWidget);
    expect(find.byKey(ValueKey("CatPageView")), findsOneWidget);
  });

}