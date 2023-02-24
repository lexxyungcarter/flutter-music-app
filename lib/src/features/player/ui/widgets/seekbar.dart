import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../utils/extensions.dart';

class Seekbar extends StatefulWidget {
  const Seekbar({
    Key? key,
    required this.position,
    required this.duration,
    this.onChanged,
    this.onChangedEnd,
  }) : super(key: key);

  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangedEnd;

  @override
  _SeekbarState createState() => _SeekbarState();
}

class _SeekbarState extends State<Seekbar> {
  double? _dragValue;

  String _formatDuration(Duration? duration) {
    if (duration == null) {
      return '--:--';
    }

    String minutes = duration.inMinutes.toString().padLeft(2, '0');
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          _formatDuration(widget.position),
          style: context.bodyMedium,
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 4,
              thumbShape: const RoundSliderThumbShape(
                disabledThumbRadius: 4,
                enabledThumbRadius: 6,
                pressedElevation: 8,
                elevation: 5,
              ),
              overlayShape: const RoundSliderOverlayShape(
                overlayRadius: 10,
              ),
              activeTrackColor: Colors.white.withOpacity(0.2),
              inactiveTrackColor: Colors.white,
              thumbColor: Colors.white,
              overlayColor: Colors.white,
            ),
            child: Slider(
              min: 0,
              max: widget.duration.inMilliseconds.toDouble() +
                  1000, // added to compensate for milliseconds conversion difference
              value: min(
                _dragValue ?? widget.position.inMilliseconds.toDouble(),
                widget.position.inMilliseconds.toDouble(),
              ),
              onChanged: (value) {
                setState(() {
                  _dragValue = value;
                });

                if (widget.onChanged != null) {
                  widget.onChanged!(Duration(milliseconds: value.round()));
                }
              },
              onChangeEnd: (value) {
                if (widget.onChangedEnd != null) {
                  widget.onChangedEnd!(
                    Duration(
                      milliseconds: value.round(),
                    ),
                  );
                }
                _dragValue = null;
              },
            ),
          ),
        ),
        Text(
          _formatDuration(widget.duration),
          style: context.bodyMedium,
        ),
      ],
    );
  }
}
