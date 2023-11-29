import 'package:education_app/core/utils/assets.dart';
import 'package:education_app/feature/playlist/presentation/widgets/controller%20widget.dart';
import 'package:education_app/feature/playlist/presentation/widgets/video_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({super.key});

  @override
  State<PlayListPage> createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.blue,
            height: size.height * .4,
            width: size.width,
            child: const Text('hello'),
          ),
          const VideoInfoWidget(),
          Spacer(),
          const ControllerWidget(),
        ],
      ),
    );
  }
}
