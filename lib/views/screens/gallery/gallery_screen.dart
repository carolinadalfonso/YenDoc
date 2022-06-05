import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "assets/images/logo.png",
      "assets/images/logo.png",
      "assets/images/logo.png",
    ];

    return Center(
      child: SizedBox.fromSize(
        size: const Size.fromHeight(550.0),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return new Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter,
                          colors: [
                            Color(0x00000000).withOpacity(0.9),
                            Color(0xff000000).withOpacity(0.01),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
