import 'dart:developer' as dev;

import 'package:cartesia_tts/cartesia.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:logging/logging.dart';

/// Minimal example of using [cartesia tts](https://www.cartesia.ai/) to produce
/// text-to-speech audio and play it using the
/// [flutter_soloud](https://github.com/alnitak/flutter_soloud) package.
/// 
/// The workflow:
/// - Authenticate with the Cartesia API
/// - Setup a text-to-speech message to request PCM audio to Cartesia and a
/// corresponding flutter_soloud stream with the same format 
/// - Request text-to-speech audio
/// - Play the audio at first chunk received
/// 
/// Note: replace the `cartesiaApiKey` with your Cartesia API key.
/// Note2: no stream buffering management. If the data comes slower than the 
/// rate of the flutter_soloud stream, the audio could have gaps.

const cartesiaApiKey = '< YOUR CARTESIA API KEY >';

void main() async {
  Logger.root.level = kDebugMode ? Level.FINE : Level.INFO;
  Logger.root.onRecord.listen((record) {
    dev.log(
      record.message,
      time: record.time,
      level: record.level.value,
      name: record.loggerName,
      zone: record.zone,
      error: record.error,
      stackTrace: record.stackTrace,
    );
  });

  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize the player.
  await SoLoud.instance.init();

  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioSource? source;
  /// When experiments and having a free Cartesia plan, consider to use
  /// a short text to do not consume too much of your API quota.
  final controller = TextEditingController(
    text: "I've seen things you people wouldn't believe. Attack "
        'ships on fire off (the) shoulder of Orion. I watched '
        'C-beams glitter in the dark near the Tannhäuser Gate. '
        'All those moments will be lost in time, like tears in '
        'rain. Time to die.',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cartesia TTS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: controller,
                minLines: 3,
                maxLines: 10,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              OutlinedButton(
                onPressed: () async {
                  await SoLoud.instance.disposeAllSources();
                  source = null;

                  final authenticated = await Cartesia.instance
                      .autenticate(cartesiaApiKey);
                  if (!authenticated) {
                    debugPrint('Failed to authenticate!');
                    return;
                  }
                  source = await Cartesia.instance.tts(controller.text);
                },
                child: const Text('Cartesia TTS'),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  if (source != null) {
                    SoLoud.instance.play(source!);
                  }
                },
                child: const Text('play again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
