import 'package:demo_fusionflourish_hub/screens/learnscreen/channel_models.dart';
import 'package:demo_fusionflourish_hub/screens/learnscreen/video_model.dart';
import 'package:demo_fusionflourish_hub/screens/learnscreen/video_screen.dart';
import 'package:flutter/material.dart';

class ChannelVideosScreen extends StatelessWidget {
  final Channel channel;

  const ChannelVideosScreen({required this.channel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('${channel.title} '),
      ),

      body: ListView.builder(
        itemCount: channel.videos?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          Video video = channel.videos![index];
          return ListTile(
            leading: Image.network(video.thumbnailUrl),
            title: Text(video.title),
            // subtitle: Text('${video.viewCount ?? "N/A"} views'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => VideoScreen(id: video.id),
              ),
            ),
          );
        },
      ),
    );
  }
}