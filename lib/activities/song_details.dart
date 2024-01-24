import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutplay/widgets/song_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongDetails extends StatefulWidget {
  const SongDetails({super.key});

  @override
  State<SongDetails> createState() => _SongDetailsState();
}

class _SongDetailsState extends State<SongDetails> {
  late AudioPlayer audio;

  //states for maintaining song
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    audio = AudioPlayer();
    playSound();
  }

  playSound() async {
    await audio.play(AssetSource('/music.mp3'), volume: 5);
    audio.getDuration().then((value) {
      duration = value ?? Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15),
            child: Column(
              children: [
                //Row
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        CupertinoIcons.multiply,
                        color: Colors.transparent,
                      ),
                      Text("Playing Now",
                          style: Theme.of(context).textTheme.bodySmall),
                      const Icon(CupertinoIcons.multiply, color: Colors.white)
                    ]),

                //SizedBox : for spacing
                const SizedBox(height: 1.5),

                //Row
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/artist.png', width: 40),
                    ),
                    const SizedBox(width: 12.5),
                    Text("The Chainsmokers",
                        style: Theme.of(context).textTheme.bodyLarge)
                  ],
                ),

                //SizedBox : for spacing
                const SizedBox(height: 40),

                //SongDetails
                const SongBanner(
                    imageUrl: "assets/banner.jpg",
                    songName: "Don't Let Me Down"),

                //SizedBox : for spacing
                const SizedBox(height: 35),

                //Expanded for song controlling
                SizedBox(
                  width: MediaQuery.of(context).size.width * .82,
                  child: StreamBuilder(
                    stream: audio.onPositionChanged,
                    builder: (context, snapshot) {
                      return ProgressBar(
                        barHeight: 4,
                        thumbRadius: 6,
                        timeLabelTextStyle:
                            Theme.of(context).textTheme.displaySmall,
                        progressBarColor:
                            Theme.of(context).colorScheme.secondary,
                        bufferedBarColor: Colors.white,
                        baseBarColor: Colors.white60,
                        thumbColor: Theme.of(context).colorScheme.secondary,
                        progress: snapshot.data ?? Duration.zero,
                        buffered: const Duration(milliseconds: 2000),
                        total: duration,
                        onSeek: (duration) async{
                          await audio.seek(duration);
                        },
                      );
                    },
                  ),
                ),

                //sizedbox
                const SizedBox(height: 30),

                //Row
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.lyrics_outlined),
                        color: Colors.white,
                        iconSize: 30),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.skip_previous),
                        color: Colors.white,
                        iconSize: 38),
                    IconButton(
                        onPressed: () async{
                          if (audio.state == PlayerState.playing) {
                            await audio.pause();
                          } else {
                            await audio.resume();
                          }
                          setState(() {});
                        },
                        icon: audio.state == PlayerState.playing ? const Icon(Icons.pause) : const Icon(Icons.play_circle),
                        color: Colors.white,
                        iconSize: 65),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.skip_next),
                        color: Colors.white,
                        iconSize: 38),
                    IconButton(
                        onPressed: () async{
                          await audio.stop();
                          await audio.play(AssetSource("music.mp3"));
                          setState(() {});
                        },
                        icon: const Icon(Icons.loop),
                        color: Colors.white,
                        iconSize: 30),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
