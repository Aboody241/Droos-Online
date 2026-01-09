import 'dart:ui' as ui;

import 'package:droos_online/core/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class UploadFileBox extends StatefulWidget {
  const UploadFileBox({super.key});

  @override
  State<UploadFileBox> createState() => _UploadFileBoxState();
}

class _UploadFileBoxState extends State<UploadFileBox> {
  DropzoneViewController? controller;
  String? fileName;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'doc',
        'docx',
        'ppt',
        'pptx',
      ],
    );

    if (result != null) {
      setState(() {
        fileName = result.files.first.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (kIsWeb)
          Positioned.fill(
            child: DropzoneView(
              onCreated: (ctrl) => controller = ctrl,
              onDrop: (file) async {
                final name = await controller!.getFilename(file);
                setState(() {
                  fileName = name;
                });
              },
            ),
          ),

        DottedBorder(
          options: RectDottedBorderOptions(
            dashPattern: const [10, 5],
            color: Colors.grey.shade400,
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.file_upload_outlined,
                  size: 48,
                  color: Colors.grey.shade500,
                ),
                const SizedBox(height: 12),
                const Text(
                  "اسحب الملف هنا أو",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: pickFile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "تصفح الملفات",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "الصيغ المدعومة: PDF, DOC, DOCX, PPT, PPTX, MP4, MP3",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (fileName != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    "تم اختيار: $fileName",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.green,
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ],
    );
  }
}
