## Cartesia TTS using Flutter

Minimal example of using [cartesia tts](https://www.cartesia.ai/) to produce text-to-speech audio and play it using the [flutter_soloud](https://github.com/alnitak/flutter_soloud) package.

The workflow:
- Authenticate with the Cartesia API
- Setup a text-to-speech message to request PCM audio to Cartesia and a
corresponding flutter_soloud stream with the same format 
- Request text-to-speech audio
- Play the audio at first chunk received

Note: replace the `cartesiaApiKey` with your Cartesia API key in `main.dart`.
