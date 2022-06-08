import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../model/Audio.dart';
import 'AssetImageButton.dart';

class MyAudioPlayer extends StatefulWidget {
  const MyAudioPlayer({
    Key? key,
    this.width,
    this.height,
    this.audioData,
    this.isVocabulary = false,
  }) : super(key: key);
  final double? width;
  final double? height;
  final Audio? audioData;
  final bool isVocabulary;

  @override
  State<MyAudioPlayer> createState() => _MyAudioPlayerState();
}

class _MyAudioPlayerState extends State<MyAudioPlayer> {
  @protected
  @mustCallSuper
  void dispose() {
    super.dispose();
    print("MyAudioPlayer dispose ");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncDispose();
    });
  }

  _asyncDispose() async {
    await Get.find<AudioPlayerController>().stop();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncInitState();
    });
  }

  _asyncInitState() async {
    if (widget.isVocabulary) {
      await Get.find<AudioPlayerController>()
          .playAudio(widget.audioData, false);
    } else {
      await Get.find<AudioPlayerController>().playAudio(widget.audioData, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isVocabulary
        ? Container(
            height: widget.height,
            width: widget.width,
            child: Expanded(
                child: IconButton(
              iconSize: widget.height,
              onPressed: () async {
                await Get.find<AudioPlayerController>().resume();
              },
              icon: Icon(Icons.volume_up_outlined),
              color: Theme.of(context).primaryColor,
            )),
          )
        : Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
                // color: Colors.blueAccent,
                border: Border.all(
              color: Colors.black,
              width: 2.0,
            )),
            child: GetX<AudioPlayerController>(builder: (controller) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      int seekval = controller.currentDuration.value - 5 * 1000;
                      await controller.seek(seekval);
                    },
                    icon: Icon(Icons.forward_5),
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(
                    controller.currentTime.value,
                  ),
                  Expanded(
                    child: Slider(
                      value: double.parse(
                          controller.currentDuration.value.toString()),
                      min: 0,
                      max:
                          double.parse(controller.maxduration.value.toString()),
                      divisions: controller.maxduration.value <= 0
                          ? 1
                          : controller.maxduration.value,
                      // label: currentpostlabel,
                      onChanged: (double value) async {
                        int seekval = value.round();
                        await controller.seek(seekval);
                      },
                    ),
                  ),
                  Text(
                    controller.maxTime.value,
                  ),
                  IconButton(
                    onPressed: () async {
                      if (controller.isplaying.value) {
                        await controller.pause();
                      } else {
                        await controller.resume();
                      }
                    },
                    icon: Icon(controller.isplaying.value
                        ? Icons.pause
                        : Icons.play_arrow),
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              );
            }),
          );
  }
}
