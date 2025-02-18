import 'package:just_audio/just_audio.dart';
import 'package:audio_service/audio_service.dart';

class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
  final AudioPlayer _player = AudioPlayer();
  final List<MediaItem> _queue = <MediaItem>[];

  AudioPlayerHandler() {
    _player.positionStream.listen((event) {
      if (event.inMilliseconds >= _player.duration!.inMilliseconds) {
        _player.pause();
        _player.seek(Duration.zero);
        _player.play();
      }
    });
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> skipToQueueItem(int index) async {
    await _player.setAudioSource(ConcatenatingAudioSource(
      children:
          _queue.map((item) => AudioSource.uri(Uri.parse(item.id))).toList(),
    ));
    _player.seek(Duration.zero, index: index);
  }

  @override
  Future<void> addQueueItem(MediaItem mediaItem) async {
    _queue.add(mediaItem);
    await _player.setAudioSource(ConcatenatingAudioSource(
      children:
          _queue.map((item) => AudioSource.uri(Uri.parse(item.id))).toList(),
    ));
  }

  @override
  Future<void> removeQueueItem(MediaItem mediaItem) async {
    _queue.remove(mediaItem);
    await _player.setAudioSource(ConcatenatingAudioSource(
      children:
          _queue.map((item) => AudioSource.uri(Uri.parse(item.id))).toList(),
    ));
  }

  @override
  Future<void> skipToNext() async {
    if (_queue.isNotEmpty) {
      await _player.seekToNext();
    }
  }

  @override
  Future<void> skipToPrevious() async {
    if (_queue.isNotEmpty) {
      await _player.seekToPrevious();
    }
  }

  @override
  Future<void> stop() async {
    await _player.stop();
  }

  @override
  Future<void> setSpeed(double speed) async {
    await _player.setSpeed(speed);
  }

  @override
  Future<void> setRepeatMode(AudioServiceRepeatMode repeatMode) async {
    switch (repeatMode) {
      case AudioServiceRepeatMode.all:
        await _player.setLoopMode(LoopMode.all);
        break;
      case AudioServiceRepeatMode.one:
        await _player.setLoopMode(LoopMode.one);
        break;
      case AudioServiceRepeatMode.none:
        await _player.setLoopMode(LoopMode.off);
        break;
      case AudioServiceRepeatMode.group:
        throw UnimplementedError();
    }
  }

  @override
  Future<void> setShuffleMode(AudioServiceShuffleMode shuffleMode) async {
    switch (shuffleMode) {
      case AudioServiceShuffleMode.all:
        await _player.setShuffleModeEnabled(true);
        break;
      case AudioServiceShuffleMode.none:
        await _player.setShuffleModeEnabled(false);
        break;
      case AudioServiceShuffleMode.group:
        throw UnimplementedError();
    }
  }
}
