import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  late VideoPlayerController controller;
  late ChewieController chewieController;
  late Chewie playerWidget;

  iniciarVideo() async {
    controller = VideoPlayerController.asset("videos/teste.mp4")
        ..initialize().then((_) {
          setState(() {});
          controller.initialize();
        });
  }
  @override
  void initState(){
    super.initState();
    iniciarVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: Chewie(
            controller:  ChewieController(
              cupertinoProgressColors: ChewieProgressColors(
                backgroundColor: Colors.red,
              ),
              videoPlayerController: controller,
              autoPlay: true,
              looping: true,
              fullScreenByDefault: true
            ),
          ),
        ),
      ),
    );
  }
}
