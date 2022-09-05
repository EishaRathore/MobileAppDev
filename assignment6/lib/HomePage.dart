
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'customAlertDialog.dart';



class MyHomePage extends StatefulWidget {
 
   final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   static final String uploadEndPoint =
      'https://pcc.edu.pk/ws/file_upload.php';
    File _image;
    double _imageWidth;
    double _imageHeight;
    String status = '';
    String base64Image;
    String errMessage = 'Error Uploading Image';
     bool uploadStatus = false;
     

 _imgFromCamera() async {
  File image = await ImagePicker.pickImage(
    source: ImageSource.camera
  );
  sendImage(image);
}

_imgFromGallery() async {
  File image = await  ImagePicker.pickImage(
      source: ImageSource.gallery, imageQuality: 50,
  );

  sendImage(image);
}

// send image  selected from gallery or camera
  sendImage(File image) async {
     final file = File(image.path);
    if(image == null) return;
    if (imageConstraint(file)) this.setState(() => _image = image);
    // get the width and height of selected image
    FileImage(image).resolve(ImageConfiguration()).addListener((ImageStreamListener((ImageInfo info, bool _){
      setState(() {
        _imageWidth = info.image.width.toDouble();
        _imageHeight = info.image.height.toDouble();
        _image = image;
      });
    })));
  }

//constraints on image
  bool imageConstraint(File image) {
    if (!['bmp', 'jpg', 'jpeg']
        .contains(image.path.split('.').last.toString())) {
      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog.ok(
            okTitle: 'Error Uploading!',
            content: 'Image format should be jpg/jpeg/bmp.',
            onPressedOk: () => Navigator.pop(context),
          );
        },
      );
      return false;
    }
    

    //constraints on Image size
    final imageSize = image.readAsBytesSync().lengthInBytes / 1024;

     if (imageSize > 2048) {
      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog.ok(
            okTitle: 'Error Uploading!',
            content: 'Image Size should be less than 2MB. Current size is ' +
                imageSize.toStringAsFixed(2) +
                ' KB',
            onPressedOk: () => Navigator.pop(context),
          );
        },
      );
      return false;
    }
    return true;
  }

  //upload Image
  uploadImage() async {
    setState(() => uploadStatus = true);

    var response = await http.post(uploadEndPoint, body: {
      'image': _image.readAsBytes().toString(),
      'name': _image.path.split('/').last.toString(),
    });

    print('response');

    if (response.statusCode != 200)
      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog.ok(
            okTitle: 'Error Uploading!',
            content: 'Server Side Error.',
            onPressedOk: () => Navigator.pop(context),
          );
        },
      );
    else {
      var result = jsonDecode(response.body);

      print(result);
      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog.ok(
            okTitle: 'Image Sent!',
            content: result['message'],
            onPressedOk: () => Navigator.pop(context),
          );
        },
      );
    }
    setState(() => uploadStatus = false);
  }


void _showPicker(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            
             decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [
               Colors.pink[300], const Color(0xFF582666)
            
            ],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomCenter,
            stops: [0.0,1.0],
            tileMode: TileMode.clamp
          ),
        ),
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library, color: Colors.white),
                    title: new Text('Gallery', style: TextStyle(color: Colors.white),),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera,color: Colors.white),
                  title: new Text('Camera', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.upload_rounded,color: Colors.white),
                  title: new Text('Upload', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    uploadImage();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
}

@override

Widget build(BuildContext context) {
  // get the width and height of current screen the app is running on
    Size size = MediaQuery.of(context).size;

    // initialize two variables that will represent final width and height of the segmentation
    // and image preview on screen
    double finalW;
    double finalH;

    // when the app is first launch usually image width and height will be null
    // therefore for default value screen width and height is given
    if(_imageWidth == null && _imageHeight == null) {
      finalW = size.width;
      finalH = size.height;
    }else {

      // ratio width and ratio height will given ratio to
     //scale up or down the preview image
      double ratioW = size.width / _imageWidth;
      double ratioH = size.height / _imageHeight;

      // final width and height after the ratio scaling is applied
      finalW = _imageWidth * ratioW*.85;
      finalH = _imageHeight * ratioH*.50;
    }
  return Scaffold(
    
    appBar: AppBar(
      centerTitle: true,
       title: Text('Image Uploading', style: TextStyle(color: Colors.white),),
      backgroundColor: Color(0xFF301934),
    ),
    body: Container(
       decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              const Color(0xFF301934), const Color(0xFF8e247d)
            
            ],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomCenter,
            stops: [0.0,1.0],
            tileMode: TileMode.clamp
          ),
        ),
      child:    Column(
      children: <Widget>[
        SizedBox(
          height: 32,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              _showPicker(context);
            },
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.transparent,
              child: _image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.file(
                        _image,
                       fit: BoxFit.fill,
                       width: finalW, 
                       height: finalH
                      ),
                    )
                  : Container(
                  
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(500)),
                      width: 200,
                      height: 200,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
            ),
            
          ),
          
        ),
        SizedBox(
              height: 20.0,
            ),
           /* OutlineButton(
             onPressed: upload('as'),
              child: Text('Upload Image', style: TextStyle(color: Colors.white)),
            ),*/
            SizedBox(
              height: 20.0,
            ),
            Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
      ],
    ),
    ),
  );
}
}

