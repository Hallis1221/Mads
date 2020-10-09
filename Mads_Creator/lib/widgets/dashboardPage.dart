import 'package:Mads_Creator/pages/loggedin/dashboard/content.dart';
import 'package:Mads_Creator/widgets/sidelayout.dart';
import 'package:Mads_Creator/pages/loggedin/dashboard/home.dart';
import 'package:Mads_Creator/pages/loggedin/dashboard/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:random_color/random_color.dart';

RandomColor _randomColor = RandomColor();
bool firstTime = true;

class DashPage extends StatefulWidget {
  DashPage({
    Key key,
    this.selected = const {
      "Home": false,
      "Dashboard": false,
      "Settings": false
    },
    @required this.page,
  }) : super(key: key);

  final Map<String, bool> selected;

  final Widget page;

  @override
  _DashPageState createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Row(
          children: [
            Container(
              height: height,
              width: width,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: width / 5,
                    height: height,
                    child: SideLayout(
                      navigationItems: [
                        NavigationItem(
                          icon: Icons.home_outlined,
                          selected: widget.selected["Home"],
                          text: "Home",
                          onClicked: () {
                            if (!widget.selected["Home"]) {
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          DashboardHomepage(),
                                ),
                              );
                            } else {}
                          },
                        ),
                        NavigationItem(
                          icon: Icons.insert_drive_file_sharp,
                          text: "Content",
                          selected: widget.selected["Content"],
                          onClicked: () {
                            if (!widget.selected["Content"]) {
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          Content(),
                                ),
                              );
                            } else {}
                          },
                        ),
                        NavigationItem(
                          selected: widget.selected["Settings"],
                          icon: Icons.settings,
                          text: "Settings",
                          onClicked: () {
                            if (!widget.selected["Settings"]) {
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          Settings(),
                                ),
                              );
                            } else {}
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        color: Color.fromARGB(255, 240, 240, 247),
                        height: height,
                        child: Column(
                          children: [
                            Container(
                              width: width,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Color.fromARGB(10, 0, 0, 0),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    width: 50,
                                    child: Icon(
                                      Icons.search,
                                      color: Color.fromARGB(255, 188, 188, 203),
                                      size: 50,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SearchBar(width: width),
                                ],
                              ),
                            ),
                            Container(child: widget.page),
                          ],
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    @required this.width,
  }) : super(key: key);

  static final List<String> searchTermsString = [
    "Home",
    "Content",
    "Settings",
    "Setting"
  ];
  static final Map<String, Widget> searchTermsLinked = {
    searchTermsString[0]: DashboardHomepage(),
    searchTermsString[1]: Content(),
    searchTermsString[2]: Settings(),
  };
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 1.34,
      child: TypeAheadField(
        hideOnEmpty: true,
        getImmediateSuggestions: true,

        textFieldConfiguration: TextFieldConfiguration(
          autofocus: false,
          decoration: InputDecoration(hintText: "Search",),
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(fontStyle: FontStyle.italic),
          focusNode: new FocusNode(),
        ),
        suggestionsCallback: (written) async {
          if (written.toLowerCase() == "all") {
            return searchTermsString;
          }
          if (firstTime) {
            FocusScope.of(context).requestFocus(new FocusNode());
            firstTime = false;
          }
          List<String> items = <String>[];
          List<String> notPrefferedItems = <String>[];
          for (var item = 0; item < searchTermsString.length; item++) {
            int matches = 0;
            for (var i = 0; i < written.length; i++) {
              if (searchTermsString[item]
                  .toLowerCase()
                  .contains(written[i].toLowerCase())) {
                matches += 1;
              }
            }

            if (matches >= searchTermsString[item].length / 20 ||
                searchTermsString[item].toLowerCase() ==
                    written.toLowerCase()) {
              if (searchTermsString[item].toLowerCase() ==
                      written.toLowerCase() ||
                  searchTermsString[item]
                      .toLowerCase()
                      .contains(written.toLowerCase())) {
                items.add(searchTermsString[item]);
                break;
              }
              notPrefferedItems.add(searchTermsString[item]);
            }
          }
          if (items.isEmpty) {
            items = notPrefferedItems;
          }

          return items;
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion),
          );
        },
        onSuggestionSelected: (String suggestion) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  searchTermsLinked[suggestion],
            ),
          );
        },
      ),
    );
  }
}
