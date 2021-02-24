part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String genre;

  BrowseButton(this.genre);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 4),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Color(0xffEBEFF6), borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: SizedBox(
              height: 36,
              width: 36,
              child: Image(image: AssetImage(getImageFromGenre(genre))),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          genre,
          style: blackTextFont.copyWith(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

String getImageFromGenre(String genre) {
  switch (genre) {
    case "Horror":
      return "assets/icon_btn_horror.png";
      break;
    case "Action":
      return "assets/icon_btn_action.png";
      break;
    case "Music":
      return "assets/icon_btn_music.png";
      break;
    case "Drama":
      return "assets/icon_btn_drama.png";
      break;
    case "War":
      return "assets/icon_btn_war.png";
      break;
    case "Crime":
      return "assets/icon_btn_crime.png";
      break;
  }
}
