import 'package:flutter/material.dart';

class FotoProfile extends StatelessWidget {
  const FotoProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://firebasestorage.googleapis.com/v0/b/start-up-it-pmw.appspot.com/o/foto%20profile.png?alt=media&token=bac8f0cf-c61c-4889-aa68-e270a6bb8dc4',
            ),
          ),
        ),
      ),
    );
  }
}
