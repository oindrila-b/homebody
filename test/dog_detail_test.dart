
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homebody/models/model_pet_details.dart';
import 'package:homebody/screens/dog_page_list.dart';
import 'package:homebody/screens/home.dart';

void main() {
  testWidgets('Home Widget Test', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(home: DogPageList(dogs: [
      PetDetails(
        id: 24,
        imagePath: 'images/dh_1_4.png',
        name: 'Chocolate',
        age: '1 month 27 Days',
        price: '25000',
        breed: 'Dachshund',
        isAdopted: false,
        species: Species.dog,
      ),
    ],)));

    expect(find.text("No Data Found"), findsNothing);
    expect(find.byKey(ValueKey("DogPageView")), findsAtLeastNWidgets(1));
  });

  testWidgets('Dog Detail Widget Test With Empty List', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(home: DogPageList(dogs: [],)));

    expect(find.text("No Data Found"), findsOneWidget);
    expect(find.byKey(ValueKey("DogPageView")), findsOneWidget);
  });


}