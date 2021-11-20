import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/resources/resources.dart';
import 'package:the_movie_db/utils/style_constants.dart';
import '../../../../main.dart';


class MovieDetailsZMainCastWidget extends StatelessWidget {
  const MovieDetailsZMainCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Series Cast',
                style: lightTheme == true ? Theme.of(context).textTheme.bodyText2:
                Theme.of(context).textTheme.bodyText2!.copyWith(color: ltPrimaryTextColor ,fontSize: 20),
              )),
          SizedBox(
            height: 300,
            child: Scrollbar(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemExtent: 120,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          //TODO: 2 раза повторяется BoxDecoration
                            color: lightTheme == true ? Colors.white : Colors.grey[850],
                            border:
                            Border.all(color: Colors.black.withOpacity(0.3)),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                        BoxShadow(
                        color:lightTheme == true ? Colors.black.withOpacity(0.3) : Colors.white.withOpacity(0.3) ,
                        blurRadius: 8,
                        offset: const Offset(0, 2))
                        ]),
                        child: ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8)

                          ),
                          child: Column(
                            children:   [
                              const Image(image: AssetImage(AppImages.actor)),
                            Padding(padding: EdgeInsets.all(8.0),
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Michael Chiklis',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Slade Wilson / Deathstroke (voice)',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
                                ),
                              ],
                            ))
                            ],
                          ),
                        ),
                      )
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: TextButton(
              onPressed: () {},
              child: Text('Full Cast & Crew'),
            ),
          )
        ],
      ),
    );
  }
}
