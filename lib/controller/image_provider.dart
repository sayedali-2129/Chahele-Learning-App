import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickProvider with ChangeNotifier {
  final firebase = FirebaseFirestore.instance;

  final imagePicker = ImagePicker();
}
