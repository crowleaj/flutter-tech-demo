import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MenuPage extends StatelessWidget {
  downloadImage() async {
    try {
      // Saved with this method.
      var dest = AndroidDestinationType.directoryDCIM;
      dest.subDirectory("Lifeshare");
      var imageId = await ImageDownloader.downloadImage(
          "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.png",
          destination: dest);
      if (imageId == null) {
        return;
      }

      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
      print(path + fileName);
    } on PlatformException catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    // downloadImage();
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: '9BP7Sk4uFu0',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        forceHideAnnotation: true,
      ),
    );
    _controller.setSize(Size.fromHeight(20));
    var view = GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        SizedBox(
          height: 150,
          width: 150,
          child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressColors: ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              )),
        ),
        Image(image: NetworkImage("https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.png"),)
      ],
    );
    // TODO: implement build
    return view;
  }
}
