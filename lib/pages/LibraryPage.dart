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
      print('Selected ID: $selectedId');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 127,
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        flexibleSpace: Column(
          children: [
            const Text(
              "열람실 좌석 현황",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
              ),
            ),
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
              height: 1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(Icons.star_rounded),
                        ],
                      ),
                    ),
                    const RoomCard(),
                    const RoomCard(),
                    const RoomCard(),
                    Container(
                      height: 0.5,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const RoomCard(),
                    const RoomCard(),
                    const RoomCard(),
                    const RoomCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  const RoomCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFECF0FF),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '제 1 열람실',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '총좌석: 320 | 사용중: 120 | 빈좌석: 200',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text('이용률'),
                SizedBox(
                  height: 5,
                ),
                Text('70%'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LocalButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapLocationButton(myId),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0),
        ),
        child: Column(
          children: [
            Icon(
              iconData,
              color: isSelected ? Colors.blue : Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? Colors.blue : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
