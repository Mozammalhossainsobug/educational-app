import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ProgressShowingWidget extends StatefulWidget {
  ProgressShowingWidget({required this.videoPlayerController, Key? key})
      : super(key: key);

  VideoPlayerController videoPlayerController;

  @override
  State<ProgressShowingWidget> createState() => _ProgressShowingWidgetState();
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}

class _ProgressShowingWidgetState extends State<ProgressShowingWidget> {
  late StreamController<Duration> _streamController;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<Duration>();
    widget.videoPlayerController.addListener(_updatePosition);
  }

  void _updatePosition() {
    if (!_streamController.isClosed) {
      _streamController.add(widget.videoPlayerController.value.position);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              VideoProgressIndicator(
                widget.videoPlayerController,
                allowScrubbing: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatDuration(snapshot.data!),
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    formatDuration(widget.videoPlayerController.value.duration),
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          );
        } else {
          return const SizedBox(); // Return an empty widget if there's no data yet
        }
      },
    );
  }

  @override
  void dispose() {
    _streamController.close();
    widget.videoPlayerController.removeListener(_updatePosition);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ProgressShowingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.videoPlayerController != oldWidget.videoPlayerController) {
      // Reset the StreamController when the videoPlayerController changes
      _streamController.close();
      _streamController = StreamController<Duration>();
      widget.videoPlayerController.addListener(_updatePosition);
    }
  }
}
