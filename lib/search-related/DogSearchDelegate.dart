import 'package:flutter/material.dart';
import 'package:homebody/search_filter_page/dog_filter_page.dart';
import 'package:homebody/screens/dog_page_list.dart';
import 'package:homebody/utils/colors.dart';
import 'package:homebody/utils/texts.dart';

class DogSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) =>
      // TODO: implement buildActions
  [
    IconButton(
      icon: const Icon(Icons.clear_rounded) ,
      onPressed: () => close(context, null),
      // {
      //   if(query.isEmpty) {
      //     close(context, null);
      //   } else {
      //     query = "";
      //   }
      // },
    ),
  ];

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    IconButton(
      icon: const Icon(Icons.arrow_back_ios_rounded) ,
      onPressed: ()  => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      color: mainBackground,
      child: DogFilterView(filterParameter: query,),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> suggestionList = dogsList;

    return Container(
      color: mainBackground,
      child: ListView.builder(
          itemCount:  suggestionList.length,
          itemBuilder: (context, index) {
            final suggestion = suggestionList[index];

            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                  height: 70,
                  color: Colors.white,
                  child: GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Container(
                          color: Colors.amber[100],
                          width: 70,
                          height: 70,
                          child: Icon(Icons.pets, color: dogPawColor),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(suggestion,
                                  style: TextStyle(
                                      color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  )
                              )
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.black54),
                      ],
                    ),
                    onTap: () {
                      query = suggestion;
                      showResults(context);
                    },
                  ),
            )
            );
          }
      ),
    );
  }

}