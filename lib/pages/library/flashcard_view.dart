import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:termflow/core/theme/app_colors.dart';
import 'flashcard_data.dart';

class FlashcardView extends StatefulWidget {
  final String topicName;
  final List<Flashcard> flashcards;

  const FlashcardView({
    super.key,
    required this.topicName,
    required this.flashcards,
  });

  @override
  State<FlashcardView> createState() => _FlashcardViewState();
}

class _FlashcardViewState extends State<FlashcardView> {
  final AppinioSwiperController controller = AppinioSwiperController();
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    if (widget.flashcards.isEmpty) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text("Bu konuda kart bulunamadı.")),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 241, 241),
      body: SafeArea(
        child: Column(
          children: [
            // ÜST KISIM (HEADER)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, size: 30, color: Colors.black87),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Column(
                    children: [
                      Text(
                        widget.topicName,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Card $currentIndex of ${widget.flashcards.length}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),

            // ORTA KISIM: SWIPER
            Expanded(
              child: AppinioSwiper(
                controller: controller,
                cardCount: widget.flashcards.length,
                backgroundCardCount: 2,
                
                // ✅ Swipe olayını yakala ve listeye ekle
                onSwipeEnd: (previousIndex, targetIndex, activity) {
                  final swipedCard = widget.flashcards[previousIndex];
                  
                  // Sola kaydırma = BİLİNMİYOR
                  if (activity.direction == AxisDirection.left) {
                    if (!unknownTerms.contains(swipedCard)) {
                      unknownTerms.add(swipedCard);
                    }
                  } 
                  // Sağa kaydırma = BİLİNİYOR
                  else if (activity.direction == AxisDirection.right) {
                    if (!knownTerms.contains(swipedCard)) {
                      knownTerms.add(swipedCard);
                    }
                  }
                  
                  if (currentIndex < widget.flashcards.length) {
                    setState(() {
                      currentIndex++;
                    });
                  }
                },
                
                onEnd: () {
                  Navigator.pop(context);
                },
                
                cardBuilder: (context, index) {
                  return Center(
                    child: FlippableFlashcard(card: widget.flashcards[index]),
                  );
                },
              ),
            ),

            // ALT KISIM: BUTONLAR
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Çarpı Butonu
                  GestureDetector(
                    onTap: () => controller.swipeLeft(),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFFF5252), width: 2),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Color(0xFFFF5252),
                        size: 35,
                      ),
                    ),
                  ),
                  // Tik Butonu
                  GestureDetector(
                    onTap: () => controller.swipeRight(),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(9, 66, 43, 10),
                          width: 3,
                        ),
                        shape: BoxShape.circle,
                        color: AppColors.primaryOrange,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// FLIPPABLE CARD WIDGET
class FlippableFlashcard extends StatefulWidget {
  final Flashcard card;
  const FlippableFlashcard({super.key, required this.card});

  @override
  State<FlippableFlashcard> createState() => _FlippableFlashcardState();
}

class _FlippableFlashcardState extends State<FlippableFlashcard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() {
      _isFront = !_isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _animation.value * 3.14159;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle);
          return Transform(
            transform: transform,
            alignment: Alignment.center,
            child: _animation.value < 0.5
                ? _buildFront()
                : Transform(
                    transform: Matrix4.identity()..rotateY(3.14159),
                    alignment: Alignment.center,
                    child: _buildBack(),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildCardContainer({required Widget child}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.60,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryOrange, width: 1),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildFront() {
    return _buildCardContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              widget.card.term,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Tap card to flip for definition",
            style: TextStyle(fontSize: 14, color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }

  Widget _buildBack() {
    return _buildCardContainer(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.card.definition,
              style: const TextStyle(fontSize: 20, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const Divider(height: 40, thickness: 1, color: Colors.grey),
            const Text(
              "Example",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '"${widget.card.example}"',
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}