import 'package:audioplayers/audioplayers.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/src/audio_cache.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Xylophone App'),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              SoundButton(
                audio: 'note1.wav',
                fill: Colors.red,
              ),

              SoundButton(
                audio: 'note2.wav',
                fill: Colors.orange,
              ),

              SoundButton(
                audio: 'note3.wav',
                fill: Colors.yellow,
              ),
              SoundButton(
                audio: 'note4.wav',
                fill: Colors.green,
              ),
              SoundButton(
                audio: 'note5.wav',
                fill: Colors.blue,
              ),
              SoundButton(
                audio: 'note6.wav',
                fill: Colors.indigo,
              ),
              SoundButton(
                audio: 'note7.wav',
                fill: Color(0xff7F00FF),
              ),
              // Image.asset('assets/Python.png'),
            ],
          ),
        ),
      ),
    );
  }
}

Widget SoundButton({required String audio, required Color fill}) {
  return Expanded(
    child: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        AudioPlayer p = AudioPlayer();
        p.play(
          AssetSource(audio),
          volume: double.infinity,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: fill,
        ),
      ),
    ),
  );
}
