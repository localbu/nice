import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/model/products.dart';
import 'package:ui_ecommerce/size_config.dart';

class ImageDetails extends StatefulWidget {
  const ImageDetails({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State < ImageDetails > createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State < ImageDetails > {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Product product = widget.product;
    return Column(
      children: [
        SizedBox(
          width: getPropScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: "zz",
              child: GestureDetector(
                child: Image.asset(product.images[currentIndex]),
                onHorizontalDragEnd: (details) {
                  if (details.velocity.pixelsPerSecond.dx > 0) {
                    // swipe left
                    setState(() {
                      currentIndex =
                        (currentIndex - 1) % product.images.length;
                      if (currentIndex < 0) {
                        currentIndex = product.images.length - 1;
                      }
                    });
                  } else {
                    // swipe right
                    setState(() {
                      currentIndex =
                        (currentIndex + 1) % product.images.length;
                    });
                  }
                })),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(product.images.length, (index) {
            return smallImage(index: index);
          }),
        )
      ],
    );
  }

  Widget smallImage({
    required int index
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 5),
        duration: defaultDuration,
        padding: EdgeInsets.all(8),
        height: getPropScreenHeight(48),
        width: getPropScreenWidth(48),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:
            kPrimaryColor.withOpacity(currentIndex == index ? 1 : 0)),
          color: Colors.white),
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }
}