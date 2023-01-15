//장민석님 page
import "package:flutter/material.dart";

class LibraryPage extends StatelessWidget {
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
                horizontal: 60,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  LocalButton(
                    name: '서울',
                    iconData: Icons.watch_later_rounded,
                  ),
                  LocalButton(
                    name: '법학',
                    iconData: Icons.gavel_rounded,
                  ),
                  LocalButton(
                    name: '안성',
                    iconData: Icons.auto_stories_rounded,
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

class LocalButton extends StatelessWidget {
  final String name;
  final IconData iconData;
  const LocalButton({
    Key? key,
    required this.name,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconData),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
