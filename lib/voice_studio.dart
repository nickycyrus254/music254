import 'package:flutter/material.dart';

class VoiceStudio extends StatefulWidget {
  const VoiceStudio({super.key});

  @override
  State<VoiceStudio> createState() => _VoiceStudioState();
}

class _VoiceStudioState extends State<VoiceStudio> {
  bool isRecording = false;
  bool hasRecording = false;

  void startRecording() {
    setState(() {
      isRecording = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Recording started..."),
      ),
    );
  }

  void stopRecording() {
    setState(() {
      isRecording = false;
      hasRecording = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Recording saved."),
      ),
    );
  }

  void playRecording() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Playing recording..."),
      ),
    );
  }

  void deleteRecording() {
    setState(() {
      hasRecording = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Recording deleted."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Voice Studio",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(
                    isRecording ? Icons.mic : Icons.mic_none,
                    size: 80,
                    color: isRecording ? Colors.red : Colors.deepPurple,
                  ),

                  const SizedBox(height: 20),

                  Text(
                    isRecording
                        ? "Recording..."
                        : "Ready to record",
                    style: const TextStyle(fontSize: 20),
                  ),

                  const SizedBox(height: 30),

                  if (!isRecording)
                    ElevatedButton.icon(
                      onPressed: startRecording,
                      icon: const Icon(Icons.fiber_manual_record),
                      label: const Text("Start Recording"),
                    ),

                  if (isRecording)
                    ElevatedButton.icon(
                      onPressed: stopRecording,
                      icon: const Icon(Icons.stop),
                      label: const Text("Stop Recording"),
                    ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

          if (hasRecording) ...[
            ElevatedButton.icon(
              onPressed: playRecording,
              icon: const Icon(Icons.play_arrow),
              label: const Text("Play Recording"),
            ),

            const SizedBox(height: 12),

            OutlinedButton.icon(
              onPressed: deleteRecording,
              icon: const Icon(Icons.delete),
              label: const Text("Delete Recording"),
            ),
          ],
        ],
      ),
    );
  }
}
