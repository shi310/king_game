import 'package:audioplayers/audioplayers.dart';
import 'package:king_game/common/common.dart';

enum MyAudioPath {
  achievement('audios/achievement.mp3'),
  click('audios/click.mp3'),
  coinDrop('audios/coin_drop.mp3'),
  dialog('audios/dialog.mp3'),
  news('audios/news.mp3'),
  scan('audios/scan.mp3'),
  setting('audios/setting.mp3'),
  exchangeSuccessful('audios/exchange_successful.mp3'),
  exchangeFailed('audios/exchange_failed.mp3');

  final String path;

  const MyAudioPath(this.path);
}

class MyAudio {
  static final MyAudio _instance = MyAudio._internal();
  factory MyAudio() => _instance;
  MyAudio._internal();

  static Future<void> play(MyAudioPath audioPath) => _instance._play(audioPath);
  static Future<void> pause() => _instance._pause();
  static Future<void> stop() => _instance._stop();
  static void dispose() => _instance._dispose();
  static Future<void> init() async {
    for (var audio in MyAudioPath.values) {
      await _instance._preload(audio);
    }
  }

  final Map<MyAudioPath, AudioPlayer> _audioPlayers = {};

  Future<void> _preload(MyAudioPath audioPath) async {
    if (!_audioPlayers.containsKey(audioPath)) {
      _audioPlayers[audioPath] = AudioPlayer();
      await _audioPlayers[audioPath]!.setSource(AssetSource(audioPath.path));
    }
  }

  Future<void> _play(MyAudioPath audioPath) async {
    if (!UserController.to.isOpenAudio) {
      return;
    }

    var player = _audioPlayers[audioPath];
    if (player == null) {
      player = AudioPlayer();
      await player.setSource(AssetSource(audioPath.path));
      _audioPlayers[audioPath] = player;
    }

    await player.seek(Duration.zero);
    await player.resume();
  }

  Future<void> _pause() async {
    for (var player in _audioPlayers.values) {
      await player.pause();
    }
  }

  Future<void> _stop() async {
    for (var player in _audioPlayers.values) {
      await player.stop();
    }
  }

  void _dispose() {
    for (var player in _audioPlayers.values) {
      player.dispose();
    }
    _audioPlayers.clear();
  }
}