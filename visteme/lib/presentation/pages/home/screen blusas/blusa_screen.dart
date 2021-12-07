import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:visteme/data/models/blusa_model.dart';
import 'package:visteme/presentation/pages/home/shopping%20cart/custom_appbar.dart';
import 'package:visteme/presentation/pages/home/widgets/hero_carousel_card.dart';

class BlusaScreen extends StatelessWidget {
  Widget create(BuildContext context) => BlusaScreen(blusa: blusa);
  final BlusaModel blusa;

  const BlusaScreen({
    required this.blusa,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: blusa.descripcion),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: [HeroCarouselCard(blusa: blusa)],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(50),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width - 10,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              blusa.descripcion,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                            /*Text(
                              '\$${blusa.precio}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),*/
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    "Product Information",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Delivery Information",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
