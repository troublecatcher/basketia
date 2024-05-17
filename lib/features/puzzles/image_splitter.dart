import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as imglib;

class ImageSplitter {
  static Future<List<Image>> initializeImagesAndTiles(
      String assetName, int row, int col) async {
    Uint8List imageData = await ImageSplitter.loadImageAsUint8List(assetName);
    List<Image> images = await compute<ImageSplitterParams, List<Image>>(
      ImageSplitter.splitImage,
      ImageSplitterParams(imageData, row, col),
    );
    return images;
  }

  static List<Image> splitImage(ImageSplitterParams params) {
    imglib.Image image = imglib.decodeImage(params.imageData)!;

    int x = 0, y = 0;
    int width = (image.width ~/ params.row).floor();
    int height = (image.height ~/ params.col).floor();

    List<imglib.Image> parts = [];
    for (int i = 0; i < params.row; i++) {
      for (int j = 0; j < params.col; j++) {
        parts.add(
          imglib.copyCrop(
            image,
            x: x,
            y: y,
            width: width,
            height: height,
          ),
        );
        x += width;
      }
      x = 0;
      y += height;
    }

    List<Image> output = [];
    for (var img in parts) {
      output.add(Image.memory(imglib.encodeJpg(img)));
    }
    return output;
  }

  static Future<Uint8List> loadImageAsUint8List(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    return Uint8List.view(data.buffer);
  }
}

class ImageSplitterParams {
  final Uint8List imageData;
  final int row;
  final int col;

  ImageSplitterParams(this.imageData, this.row, this.col);
}
