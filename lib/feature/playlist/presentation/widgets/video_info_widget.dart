import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoInfoWidget extends StatefulWidget {
  const VideoInfoWidget({
    Key? key,
    required this.chapter,
    required this.videoTitle,
    required this.bookmarks,
    required this.videoPlayerController,
  }) : super(key: key);

  final int chapter;
  final String videoTitle;
  final List<Duration> bookmarks;
  final VideoPlayerController videoPlayerController;

  @override
  State<VideoInfoWidget> createState() => _VideoInfoWidgetState();
}

class _VideoInfoWidgetState extends State<VideoInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 15,
                    color: Colors.black54,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        "Chapter ${widget.chapter}: ",
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.videoTitle,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  showBookmarks();
                },
                child: const Row(
                  children: [
                    Icon(Icons.bookmark),
                    SizedBox(width: 5),
                    Text('Bookmarks'),
                  ],
                ),
              ),
              const Row(
                children: [
                  Icon(Icons.flag_outlined),
                  SizedBox(width: 5),
                  Text('Report'),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.download),
                  SizedBox(width: 5),
                  Text('Download'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showBookmarks() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: const Text('Bookmarks'),
            content: Column(
              children: List.generate(
                widget.bookmarks.length,
                (index) => ListTile(
                  title: Text(
                    'Bookmark ${index + 1}',
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    _startFromBookmark(index);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _startFromBookmark(int index) {
    widget.videoPlayerController.seekTo(widget.bookmarks[index]);
    widget.videoPlayerController.play();
  }
}
