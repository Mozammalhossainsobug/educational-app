import 'package:education_app/core/utils/assets.dart';
import 'package:education_app/feature/playlist/domain/entities/video_entity.dart';
import 'package:education_app/feature/playlist/presentation/widgets/progress_showing_widget.dart';
import 'package:education_app/feature/playlist/presentation/widgets/video_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:video_player/video_player.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({required this.playlist, Key? key}) : super(key: key);

  final List<VideoEntity> playlist;

  @override
  State<PlayListPage> createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  late VideoPlayerController _videoPlayerController;
  int _currentIndex = 0;
  late IconData _playPauseButtonIcon;
  int chapter = 0;
  String videoTitle = '';
  List<Duration> bookmarks = [];
  int completedModule = 0;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
    _playPauseButtonIcon = Icons.play_arrow_outlined;
    _videoPlayerController.pause();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<void> _initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.asset(widget.playlist[_currentIndex].videoUrl);

    await _videoPlayerController.initialize();

    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        completedModule++;
        _playNextVideo();
      }
    });
  }

  void _playNextVideo() {
    if (_currentIndex < widget.playlist.length - 1) {
      setState(() {
        _videoPlayerController.dispose();
        _playPauseButtonIcon = Icons.play_arrow_outlined;
        _currentIndex++;
        _initializePlayer();
        _videoPlayerController.pause();
      });
    }

    if (completedModule == widget.playlist.length) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          title: 'Congratulations',
          text: 'Claim Your Certificate',
          onConfirmBtnTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
          });
    }
  }

  void _playPreviousVideo() {
    if (_currentIndex > 0) {
      setState(() {
        _videoPlayerController.dispose();
        _playPauseButtonIcon = Icons.play_arrow_outlined;
        _currentIndex--;
        _initializePlayer();
        _videoPlayerController.pause();
      });
    }
  }

  void _decisionPlayPauseButton() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      setState(() {
        _playPauseButtonIcon = Icons.play_arrow_outlined;
      });
    } else {
      _videoPlayerController.play();
      setState(() {
        _playPauseButtonIcon = Icons.pause;
      });
    }
  }

  void _bookmarkVideo() {
    setState(() {
      bookmarks.add(_videoPlayerController.value.position);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    videoTitle = widget.playlist[_currentIndex].videoTitle;
    chapter = widget.playlist[_currentIndex].chapter;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              _decisionPlayPauseButton();
            },
            onDoubleTap: () {
              _bookmarkVideo();
            },
            child: SizedBox(
              height: size.height * 0.4,
              width: size.width,
              child: AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              children: [
                ProgressShowingWidget(
                  videoPlayerController: _videoPlayerController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.replay_10),
                      onPressed: () {
                        _videoPlayerController.seekTo(Duration(
                          seconds:
                              _videoPlayerController.value.position.inSeconds -
                                  10,
                        ));
                      },
                    ),
                    IconButton(
                      icon: Icon(_playPauseButtonIcon),
                      onPressed: _decisionPlayPauseButton,
                    ),
                    IconButton(
                      icon: const Icon(Icons.forward_10),
                      onPressed: () {
                        _videoPlayerController.seekTo(Duration(
                          seconds:
                              _videoPlayerController.value.position.inSeconds +
                                  10,
                        ));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          VideoInfoWidget(
            chapter: chapter,
            bookmarks: bookmarks,
            videoPlayerController: _videoPlayerController,
            videoTitle: videoTitle,
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.only(
              bottom: size.height * .06,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * .4,
                  margin: EdgeInsets.only(left: 20.h),
                  padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.playlist_add,
                        color: Colors.green,
                      ),
                      SizedBox(width: 3),
                      Text(
                        'Text Syllabus',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width * .4,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: _playPreviousVideo,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          margin: EdgeInsets.only(right: 10.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Image.asset(
                              Assets.backIcon,
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: GestureDetector(
                          onTap: _playNextVideo,
                          child: Center(
                            child: Row(
                              children: [
                                const Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Image.asset(
                                  Assets.forwardIcon,
                                  width: 25,
                                  height: 25,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
