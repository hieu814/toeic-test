import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import '../../model/Audio.dart';
import '../../utils/constant.dart';

class AudioPlayerController extends GetxController {
  static AudioPlayerController instance = Get.find();
  RxInt currentDuration = RxInt(0);
  RxInt maxduration = RxInt(1);
  RxBool isplaying = RxBool(false);
  RxString maxTime = RxString("00:00");
  RxString currentTime = RxString("00:00");
  AudioPlayer audioPlayer = AudioPlayer();
  void _init() async {
    try {
      await audioPlayer.stop();
      await audioPlayer.setUrl("");
      maxTime.value = "00:00";
      currentTime.value = "00:00";
      maxduration.value = 1;
      currentDuration.value = 0;
    } catch (_) {}
  }

  AudioPlayerController() {
    audioPlayer.onDurationChanged.listen((Duration d) {
      maxduration.value = d.inMilliseconds;
      maxTime.value = getStringDuration(maxduration.value);
    });
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      currentDuration.value = p.inMilliseconds;
      if (currentDuration.value > maxduration.value) {
        currentDuration.value = maxduration.value;
      }
      currentTime.value = getStringDuration(currentDuration.value);
      // print("get current time ${currentTime.value}");
    });
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      if (s == PlayerState.PLAYING) {
        isplaying.value = true;
      } else {
        isplaying.value = false;
      }
    });
  }
  String getStringDuration(int dura) {
    int shours = Duration(milliseconds: dura).inHours;
    int sminutes = Duration(milliseconds: dura).inMinutes;
    int sseconds = Duration(milliseconds: dura).inSeconds;

    int rhours = shours;
    int rminutes = sminutes - (shours * 60);
    int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);
    if (rhours == 0) {
      return "${rminutes.toString().padLeft(2, "0")}:${rseconds.toString().padLeft(2, "0")}";
    }
    return "${rhours.toString().padLeft(2, "0")}:${rminutes.toString().padLeft(2, "0")}:${rseconds.toString().padLeft(2, "0")}";
  }

  Future<void> playFromServer(String url) async {
    try {
      _init();
      await audioPlayer.play(url);
    } catch (e) {
      print("error: ${e.toString()}");
    }
  }

  Future<void> setUrl(String url) async {
    try {
      _init();
      await audioPlayer.setUrl(url);
    } catch (e) {
      print("error: ${e.toString()}");
    }
  }

  Future<void> playAudio(Audio? audio, bool isplay) async {
    try {
      _init();
      String url = "http://${MyConfig.apiURL}${audio!.url.toString()}";
      if (isplay) {
        await playFromServer(url);
      } else {
        setUrl(url);
      }
    } catch (e) {
      print("error: ${e.toString()}");
    }
  }

  Future<void> playLocal(String url) async {
    try {
      await audioPlayer.stop();
      await audioPlayer.play(url);
    } catch (e) {
      print("error: ${e.toString()}");
    }
  }

  Future<void> pause() async {
    try {
      await audioPlayer.pause();
    } catch (e) {
      print("error: ${e.toString()}");
    }
  }

  Future<void> stop() async {
    try {
      await audioPlayer.stop();
    } catch (e) {
      print("error: ${e.toString()}");
    }
  }

  Future<void> resume() async {
    try {
      await audioPlayer.resume();
    } catch (e) {
      print("error: ${e.toString()}");
    }
  }

  Future<void> seek(int value) async {
    if (value < 0) {
      value = 0;
    }

    await audioPlayer.seek(Duration(milliseconds: value));
  }
}
