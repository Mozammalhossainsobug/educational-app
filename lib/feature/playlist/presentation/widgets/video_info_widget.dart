import 'package:flutter/material.dart';

class VideoInfoWidget extends StatefulWidget {
  const VideoInfoWidget({super.key});

  @override
  State<VideoInfoWidget> createState() => _VideoInfoWidgetState();
}

class _VideoInfoWidgetState extends State<VideoInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
              const Text(
                'Chapter 11:Show Gratitude',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text('Video: Title'),
          const Divider(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(Icons.share),
                  SizedBox(width: 5),
                  Text('Share'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.flag_outlined),
                  SizedBox(width: 5),
                  Text('Report'),
                ],
              ),
              Row(
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
}
