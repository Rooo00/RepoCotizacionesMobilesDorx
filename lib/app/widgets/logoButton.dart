import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoButton extends StatefulWidget {
  const LogoButton({super.key});

  @override
  State<LogoButton> createState() => _LogoButtonState();
}

class _LogoButtonState extends State<LogoButton> {
  final ValueNotifier<String?> _logoNotifier = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    _logoNotifier.value = await _getImage();
  }

  Future<void> _pickAndSaveImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final base64Image = base64Encode(bytes);
      await _saveImage(base64Image);
      _logoNotifier.value = base64Image;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: _logoNotifier,
      builder: (context, logo, child) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.7, color: Theme.of(context).shadowColor),
            borderRadius: BorderRadius.circular(16),
          ),
          width: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              if (logo != null)
                const Positioned(
                  top: 4,
                  right: 7,
                  child: Icon(Icons.check, color: Colors.green),
                ),
              CupertinoButton(
                borderRadius: BorderRadius.circular(12),
                onPressed: _pickAndSaveImage,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: logo != null
                    ? Image.memory(base64Decode(logo), height: 130)
                    : const Text(
                        "Agregar Logo",
                        style: TextStyle(color: Color.fromARGB(255, 24, 24, 24)),
                      ), minimumSize: Size(60, 60),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _logoNotifier.dispose();
    super.dispose();
  }
}

// Funciones de utilidad para almacenamiento de imágenes
Future<void> _saveImage(String base64Image) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('logo', base64Image);
}

Future<String?> _getImage() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('logo');
}