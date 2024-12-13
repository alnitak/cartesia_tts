// ignore_for_file: avoid_redundant_argument_values

import 'dart:convert';
import 'dart:io';

import 'package:cartesia_tts/model/response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

class Cartesia {
  Cartesia._();

  static final Cartesia instance = Cartesia._();
  
  WebSocketChannel? channel;
  AudioSource? currentSound;
  int numberOfChunks = 0;
  int byteSize = 0;

  Future<bool> autenticate(String apikey) async {
    final websocketUri =
      'wss://api.cartesia.ai/tts/websocket?'
      'cartesia_version=2024-06-10&api_key=$apikey';
    channel = WebSocketChannel.connect(Uri.parse(websocketUri));

    /// Wait for the websocket to be ready
    try {
      await channel?.ready;
    } on SocketException catch (e) {
      debugPrint(e.toString());
      return false;
    } on WebSocketChannelException catch (e) {
      debugPrint(e.toString());
      return false;
    }
    return true;
  }

  Future<AudioSource>? tts(String text) async {
    /// Some other voices IDs
    // "id": "a0e99841-438c-4a64-b679-ae501e7d6091"
    // "id": "248be419-c632-4f23-adf1-5324ed7dbf1d"
    final msg = '''
{
  "model_id": "sonic-english",
  "transcript": "'$text'",
  "voice": {
    "mode": "id",
    "id": "79f8b5fb-2cc8-479a-80df-29f7a7cf1a3e"
  },
  "language": "en",
  "context_id": "happy-monkeys-fly",
  "output_format": {
    "container": "raw",
    "encoding": "pcm_s16le",
    "sample_rate": 8000
  },
  "continue": false
}
''';

    /// Initialize the stream to reflect the requested PCM data format.
    final currentSound = SoLoud.instance.setBufferStream(
      maxBufferSize: 1024 * 1024 * 10, // 10 MB
      sampleRate: 8000,
      channels: Channels.mono,
      pcmFormat: BufferPcmType.s16le,
      onBuffering: (isBuffering, handle, time) async {
        debugPrint('buffering');
      },
    );

    channel?.sink.add(msg);
    numberOfChunks = 0;
    byteSize = 0;

    /// Listen to the websocket
    channel?.stream.listen(
      (message) async {
        message as String;

        final msg = ResponseModel.fromJson(
          jsonDecode(message) as Map<String, dynamic>,
        );
        if (msg.type != 'chunk' || msg.data == null) {
          await channel?.sink.close();
          return;
        }

        /// Convert audio Base64 audio data and append to [currentSound].
        try {
          final data = base64Decode(msg.data!);
          SoLoud.instance.addAudioDataStream(
            currentSound,
            data,
          );
        } on SoLoudPcmBufferFullCppException {
          debugPrint('pcm buffer full or stream already set '
              'to be ended');
          await channel?.sink.close(status.goingAway);
        } catch (e) {
          debugPrint(e.toString());
        }

        /// If this is the first chunk, start the audio.
        if (numberOfChunks == 0) {
          await SoLoud.instance.play(currentSound);
        }

        numberOfChunks++;
        byteSize += msg.data?.length ?? 0;
        debugPrint('numberOfChunks: $numberOfChunks  byteSize: $byteSize');
      },
      onDone: () async {
        /// When the websocket is closed, sent [currentSound] to be ended.
        SoLoud.instance.setDataIsEnded(currentSound);

        debugPrint('ws channel closed.');
      },
      onError: (error) {
        debugPrint('ws channel error.');
      },
    );

    return currentSound;
  }

  Future<bool> stop() async {
    await channel?.sink.close();
    return true;
  }
}
