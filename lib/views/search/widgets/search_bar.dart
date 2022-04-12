import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/color_palette.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String currentText ="";
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: ColorPalette.textColor,
            )
          ]),

      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (text) {
                currentText = text;
                print(text);
              },
              onSubmitted: (text) {
                // Implement Search
                // searchController.fetchSearchDisplayList(text);
                // Get.to(() => SearchResultPage(
                //   animeList: searchController.searchAnimeList,
                //   controller: searchController.scrollController,
                // )
                // );
              },

              style: const TextStyle(
                color: ColorPalette.black,
              ),
              decoration: InputDecoration(
                hintText: "Search by Title",
                hintStyle: const TextStyle(
                  color: ColorPalette.secondaryColor,
                ),
                // fillColor: Colors.red,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: GestureDetector(
                  onTap: () {
                    // searchController.fetchSearchDisplayList(currentText);
                    // Get.to(() => SearchResultPage(
                    //   animeList: searchController.searchAnimeList,
                    //   controller: searchController.scrollController,
                    // ));
                  },
                  child: const Icon(
                    Icons.search_rounded,
                    color: ColorPalette.secondaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // color: Colors.white,
    );
  }
}