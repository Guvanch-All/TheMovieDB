import 'package:flutter/material.dart';
import 'package:the_movie_db/utils/widget_draw/draw_progress.dart';
import 'package:the_movie_db/resources/resources.dart';
import 'package:the_movie_db/utils/style_constants.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TopPosters(),
        Padding(padding: EdgeInsets.all(20), child: _MovieNameWidget()),
        Divider(),
        _ScoreWidget(),
        _SummeryWidget(),
        _OverView(),
        Divider(),
        _MainRole(),
        SizedBox(height: 20,)
      ],
    );
  }
}

class TopPosters extends StatelessWidget {
  const TopPosters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Image(image: AssetImage(AppImages.dedaPull)),
        Positioned(
            top: 20,
            left: 20,
            bottom: 20,
            child: Image(image: AssetImage(AppImages.deadPullBack)))
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.start,
      text: TextSpan(children: [
        TextSpan(
            text: 'Deathstroke: Knights & Dragons - The Movie',
            style: Theme
                .of(context)
                .textTheme
                .bodyText2),
        TextSpan(
            text: ' (2020)',
            style: Theme
                .of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: ltPrimaryGreyColor)),
      ]),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: const [
              SizedBox(
                width: 45,
                height: 45,
                child: RadialPercentWidget(
                  child: Text('69%',style: TextStyle(fontSize: 10, color: Colors.white)),
                  percent: 0.69,
                  fillColor: Color(0xFF202126),
                  lineColor: Color(0xFF9FBF46),
                  freeColor: Color(0xFFF5E28B),
                  lineWidth: 0.011,),
              ),
              SizedBox(width: 10),
              Text('User score'),
            ],
          ),
        ),
        Container(width: 1, height: 15, color: Colors.grey),
        TextButton(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.play_arrow,size: 30,),
                Text('Play Trailer'),
              ],
            )),
      ],
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
      child: Text(
        'R, 08/04/2020 (US) • Animation, '
            'Action, Adventure, Science Fiction • 1h 27m',
        style: Theme
            .of(context)
            .textTheme
            .bodyText1,
        maxLines: 3,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  const _OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OverView',
            style: Theme
                .of(context)
                .textTheme
                .bodyText2,
          ),
          const SizedBox(height: 10),
          Text(
            'The assassin Deathstroke tries to save his family from the wrath '
                'of H.I.V.E. and the murderous Jackal.',
            style: Theme
                .of(context)
                .textTheme
                .bodyText1,
          )
        ],
      ),
    );
  }
}

class _MainRole extends StatelessWidget {
  const _MainRole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('George Pérez',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText2),
                Text('Characters',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('George Pérez',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText2),
                Text('Characters',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('George Pérez',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText2),
                Text('Characters',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('George Pérez',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText2),
                Text('Characters',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
