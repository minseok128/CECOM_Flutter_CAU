//장민석님 page
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

class LibraryPage extends StatefulWidget {
  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int selectedId = 0;
  late SharedPreferences prefs;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt('libraryPage_selectedId');
    if (id != null) {
      setState(() {
        selectedId = id;
      });
    } else {
      prefs.setInt('libraryPage_selectedId', 0);
    }
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void onTapLocationButton(int id) {
    setState(() {
      selectedId = id;
      prefs.setInt('libraryPage_selectedId', id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        title: const Text(
          "열람실 좌석 현황",
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LocalButton(
                    name: '서울',
                    iconData: Icons.watch_later_rounded,
                    myId: 0,
                    isSelected: (selectedId == 0) ? true : false,
                    onTapLocationButton: onTapLocationButton,
                  ),
                  LocalButton(
                    name: '법학',
                    iconData: Icons.gavel_rounded,
                    myId: 1,
                    isSelected: (selectedId == 1) ? true : false,
                    onTapLocationButton: onTapLocationButton,
                  ),
                  LocalButton(
                    name: '안성',
                    iconData: Icons.auto_stories_rounded,
                    myId: 2,
                    isSelected: (selectedId == 2) ? true : false,
                    onTapLocationButton: onTapLocationButton,
                  ),
                ],
              ),
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}

class LocalButton extends StatefulWidget {
  final String name;
  final IconData iconData;
  final bool isSelected;
  final int myId;
  final Function onTapLocationButton;
  const LocalButton({
    Key? key,
    required this.name,
    required this.iconData,
    required this.isSelected,
    required this.myId,
    required this.onTapLocationButton,
  }) : super(key: key);

  @override
  State<LocalButton> createState() => _LocalButtonState();
}

class _LocalButtonState extends State<LocalButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTapLocationButton(widget.myId),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0),
        ),
        child: Column(
          children: [
            Icon(
              widget.iconData,
              color: widget.isSelected ? Colors.blue : Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 16,
                color: widget.isSelected ? Colors.blue : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
