import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class ImageInputWidget extends StatefulWidget {
  final Function onPickedImage;

  const ImageInputWidget({required this.onPickedImage});


  @override
  _ImageInputWidgetState createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
  File? storedImage;

  Future<void> takePicture() async {
    final ImagePicker picker = ImagePicker();
    print('hello');
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if(image==null){
      return;
    }
    setState(() {
      storedImage = File(image.path);
    });

    Directory appDir = await pathProvider.getApplicationDocumentsDirectory();
    await storedImage!.copy(appDir.path+'/hello.jpg');
    widget.onPickedImage(storedImage);
  }



  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: storedImage != null
              ? Image.file(
                  storedImage!,
                  fit: BoxFit.cover,
                )
              : Text('blank'),
          alignment: Alignment.center,
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ElevatedButton.icon(
            icon: Icon(Icons.camera),
            onPressed: takePicture,
            label: Text(
              'Take Picture',
              textAlign: TextAlign.center,
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey, padding: EdgeInsets.all(10)),
          ),
        ),
      ],
    );
  }
}
