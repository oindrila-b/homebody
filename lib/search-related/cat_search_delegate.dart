import 'package:flutter/material.dart';
import 'package:homebody/utils/texts.dart';

import '../models/model_pet_details.dart';
import '../search_filter_page/cat_filter_page.dart';
import '../utils/colors.dart';

class CatSearchDelegate extends SearchDelegate {
  final List<PetDetails> pets;

  CatSearchDelegate(this.pets);

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear_rounded),
          onPressed: () => close(context, null),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_rounded),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: mainBackground,
      child: CatFilterView(
        filterParameter: query,
        updatedPetList: pets,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = catsList;

    return Container(
      color: mainBackground,
      child: ListView.builder(
          itemCount: suggestionList.length,
          itemBuilder: (context, index) {
            final suggestion = suggestionList[index];

            return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                  height: 70,
                  color: Colors.white,
                  child: GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Container(
                          color: Colors.amber[100],
                          width: 70,
                          height: 70,
                          child: Icon(Icons.pets, color: catPawColor),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(suggestion,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                    onTap: () {
                      query = suggestion;
                      showResults(context);
                    },
                  ),
                ));
          }),
    );
  }
}
