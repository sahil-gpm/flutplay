import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongBanner extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final String? imageUrl;
  final String songName;

  const SongBanner({super.key, required this.imageUrl, required this.songName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .85,
      child: Column(children: [
        //Cliprect
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageUrl ?? "",
              fit: BoxFit.cover,
            )),

        //sizedbox
        const SizedBox(height: 30),

        //Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                Text(songName, style: Theme.of(context).textTheme.displayLarge),
                Text("The Chainsmokers, Feat.Halsey", style: Theme.of(context).textTheme.bodySmall)
              ]),
            ),
            Icon(CupertinoIcons.heart_fill,
                color: Theme.of(context).colorScheme.secondary, size: 30)
          ],
        )
      ]),
    );
  }
}
