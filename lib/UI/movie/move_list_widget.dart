import 'package:flutter/material.dart';
import 'package:the_movie_db/resources/resources.dart';
import 'package:the_movie_db/utils/style_constants.dart';

class MoveListWidget extends StatelessWidget {
  const MoveListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemExtent: 163,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.3)),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2))
                      ]),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    children: [
                      const Image(image: AssetImage(AppImages.space)),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Space Jam: A New Legacy',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 7),
                            Text(
                              '07/16/2021',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.grey),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "'When LeBron and his young son Dom are trapped in"
                              " a digital space by a rogue A.I., LeBron must"
                              " get them home safe by leading Bugs, Lola Bunny"
                              " and the whole gang of notoriously "
                              "undisciplined Looney Tunes to victory over "
                              "the A.I.'s digitized champions on the court. "
                              "It's Tunes versus Goons in the highest-stakes"
                              " challenge of his life.'",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius:const BorderRadius.all(Radius.circular(10)),
                    splashColor: Colors.blueAccent.withOpacity(0.3),
                    onTap: (){},
                  ),
                )
              ],
            ),
          );
        });
  }
}
