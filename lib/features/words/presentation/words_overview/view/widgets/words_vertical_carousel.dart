import 'dart:math' as math;

import 'package:english_training_app/features/words/domain/entities/entities.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class WordsVerticalCarousel extends StatelessWidget {
  const WordsVerticalCarousel({super.key, required this.words});

  final List<Word> words;

  @override
  Widget build(BuildContext context) {
    if (words.isEmpty) {
      return const SizedBox.shrink();
    }

    return CarouselSlider.builder(
      itemCount: words.length,
      itemBuilder: (context, index, realIdx) {
        final word = words[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
          child: _MiniFlipCard(word: word),
        );
      },
      options: CarouselOptions(
        height: 180,
        viewportFraction: 0.34,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        pageSnapping: true,
        padEnds: true,
      ),
    );
  }
}

class _MiniFlipCard extends StatefulWidget {
  const _MiniFlipCard({required this.word});

  final Word word;

  @override
  State<_MiniFlipCard> createState() => _MiniFlipCardState();
}

class _MiniFlipCardState extends State<_MiniFlipCard> {
  bool _flipped = false;

  void _toggle() {
    setState(() => _flipped = !_flipped);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _toggle,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 250),
        tween: Tween<double>(begin: 0, end: _flipped ? math.pi : 0),
        curve: Curves.easeInOut,
        builder: (context, angle, child) {
          final isFront = angle <= math.pi / 2;
          final display =
              isFront
                  ? _CardFace(text: widget.word.mainWord, style: textStyle)
                  : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: _CardFace(
                      text: widget.word.translate,
                      style: textStyle,
                    ),
                  );

          return Transform(
            alignment: Alignment.center,
            transform:
                Matrix4.identity()
                  ..setEntry(3, 2, 0.0015)
                  ..rotateY(angle),
            child: display,
          );
        },
      ),
    );
  }
}

class _CardFace extends StatelessWidget {
  const _CardFace({required this.text, required this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        alignment: Alignment.center,
        child: Text(
          text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: style,
        ),
      ),
    );
  }
}
