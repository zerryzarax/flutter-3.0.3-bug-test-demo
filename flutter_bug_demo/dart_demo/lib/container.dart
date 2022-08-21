import 'package:flutter/material.dart';

class ContainerMain extends StatefulWidget {
  bool? inApp;
  ContainerMain({bool inApp = true}) {
    this.inApp = inApp;
  }
  @override
  _ContainerMain createState() => _ContainerMain(inApp: this.inApp!);
}

class _ContainerMain extends State<ContainerMain> {
  bool? inApp;

  ImageCache? get imageCache => PaintingBinding.instance.imageCache;

  _ContainerMain({bool inApp = true}) {
    this.inApp = inApp;
  }

  @override
  void initState() {
    if(imageCache != null) {
      imageCache!.maximumSize = 100;
      imageCache!.maximumSizeBytes = 10 << 20;
    }

    if (!this.inApp!) {
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //change the text content and save file when the first attach run that can reappear the bug
      home: Container(alignment: Alignment.center, color: Colors.yellow, child: Text("testtest2"),),
    );
  }
}
