import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:matka/Controller/crouse_imageText_Controller.dart';
import 'package:matka/generated/color.dart';
import 'package:provider/provider.dart';

class CustomCrousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ImageTextController>();

    final crousel = controller.crouselL;
    final text = controller.text;
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: crousel.length,
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.black, offset: Offset(-1, -1)),
                ]),
                child: CachedNetworkImage(
                  imageUrl: crousel[index],
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SizedBox(
                    height: 30,
                    width: 30,
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            disableCenter: true,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            aspectRatio: 16 / 7,
            pageSnapping: false,
            // animateToClosest: false,
          ),
        ),
        Container(
          height: size.height * 0.04,
          color: Materialcolor.thirdColor,
          child: Center(
            child: Marquee(
              text: text,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: size.width,
              accelerationCurve: Curves.linear,
              showFadingOnlyWhenScrolling: true,
              startPadding: size.width - 20,
              style: GoogleFonts.cairo(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
