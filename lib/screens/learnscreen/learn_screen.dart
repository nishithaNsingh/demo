import 'package:flutter/material.dart';
import 'api_services.dart';
import 'channel_models.dart';
import 'video_model.dart';
import 'video_screen.dart';

class LearnScreen extends StatefulWidget {
  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  List<Channel> _channels = []; // Use a list to store multiple channels
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannels();
  }

  _initChannels() async {
    List<String> channelIds = [
      'UCpc5l0T_wYgap4RtIF6YeVg',
      'UCjw7M5WI3ZYO-j4DDjS5evw',
      'UC9eryd1JLe6l5oraEAxQ5Bw',
      'UCVaSUu1B_Y4R2rFLUpvRmlA'
      // Add more channel IDs as needed
    ];

    for (String channelId in channelIds) {
      Channel channel = await APIService.instance.fetchChannel(
          channelId: channelId);
      setState(() {
        _channels.add(channel);
      });
    }
  }

  _buildProfileInfo(Channel channel) {
    // Use the provided channel parameter instead of _channel
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      height: 100.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage(channel.profilePictureUrl ?? ''),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  channel.title ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${channel.subscriberCount ?? 0} subscribers',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildVideo(Channel channel, Video video) {
    // Use the provided channel parameter instead of _channel
    return GestureDetector(
      onTap: () =>
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VideoScreen(id: video.id),
            ),
          ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: const EdgeInsets.all(10.0),
        height: 140.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailUrl),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos(Channel channel) async {
    // Use the provided channel parameter instead of _channel
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: channel.uploadPlaylistId ?? '');
    List<Video> allVideos = channel.videos ?? []..addAll(moreVideos);
    setState(() {
      channel.videos = allVideos;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _channels.isNotEmpty
          ? NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollDetails) {
          if (!_isLoading &&
              _channels.any((channel) =>
              channel.videos.length !=
                  int.parse(channel.videoCount) &&
                  scrollDetails.metrics.pixels ==
                      scrollDetails.metrics.maxScrollExtent)) {
            // Load more videos for each channel
            for (Channel channel in _channels) {
              _loadMoreVideos(channel);
            }
          }
          return false;
        },
        child: ListView.builder(
          itemCount: _channels.length * 2,
          // Double the item count to account for profile info and videos
          itemBuilder: (BuildContext context, int index) {
            if (index.isEven) {
              // Display profile info for even indices
              int channelIndex = index ~/ 2;
              if (channelIndex < _channels.length) {
                return _buildProfileInfo(_channels[channelIndex]);
              }
            } else {
              // Display videos for odd indices
              int channelIndex = (index - 1) ~/ 2;
              if (channelIndex < _channels.length) {
                int videoIndex = (index - 1) %
                    _channels[channelIndex].videos.length;
                Video video = _channels[channelIndex].videos[videoIndex];
                return _buildVideo(_channels[channelIndex], video);
              }
            }
            return SizedBox(); // Return an empty SizedBox if index is out of bounds
          },
        ),
      )
          : Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme
                .of(context)
                .primaryColor,
          ),
        ),
      ),
    );
  }
}
