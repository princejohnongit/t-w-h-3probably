import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> videos = [
      'assets/videos/video1.mp4',
      
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Videos'),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return VideoCard(videoPath: videos[index]);
        },
      ),
    );
  }
}

class VideoCard extends StatefulWidget {
  final String videoPath;
  const VideoCard({super.key, required this.videoPath});

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const CircularProgressIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying ? _controller.pause() : _controller.play();
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.replay),
                onPressed: () {
                  _controller.seekTo(Duration.zero);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
