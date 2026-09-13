import 'package:flutter/material.dart';

class FloatingBook extends StatefulWidget {
  const FloatingBook({super.key});

  @override
  State<FloatingBook> createState() => _FloatingBookState();
}

class _FloatingBookState extends State<FloatingBook> with SingleTickerProviderStateMixin {
  late final AnimationController _floatController;

  @override
  void initState() {
    super.initState();

    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _floatController,
      builder: (context, child) {
        final offset = Tween<double>(
          begin: -7,
          end: 7,
        ).evaluate(CurvedAnimation(parent: _floatController, curve: Curves.easeInOut));

        final rotation = Tween<double>(
          begin: -0.025,
          end: 0.025,
        ).evaluate(CurvedAnimation(parent: _floatController, curve: Curves.easeInOut));

        return Transform.translate(
          offset: Offset(0, offset),
          child: Transform.rotate(angle: rotation, child: child),
        );
      },
      child: const _BookArtwork(),
    );
  }
}

class _BookArtwork extends StatelessWidget {
  const _BookArtwork();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 245,
      height: 245,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 205,
            height: 205,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF7655FF).withValues(alpha: 0.08),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF7655FF).withValues(alpha: 0.22),
                  blurRadius: 80,
                  spreadRadius: 15,
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 20,
            child: Container(
              width: 145,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.black.withValues(alpha: 0.25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.35),
                    blurRadius: 25,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),
          ),

          Transform.rotate(
            angle: -0.09,
            child: Container(
              width: 145,
              height: 185,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  topRight: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF9B7CFF), Color(0xFF6040E8)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF7655FF).withValues(alpha: 0.40),
                    blurRadius: 35,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 14,
                    top: 14,
                    bottom: 14,
                    child: Container(
                      width: 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withValues(alpha: 0.18),
                      ),
                    ),
                  ),

                  const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.auto_stories_rounded, color: Colors.white, size: 38),
                        SizedBox(height: 13),
                        Text(
                          'READ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 3,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'MORE',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Transform.translate(
            offset: const Offset(42, 10),
            child: Transform.rotate(
              angle: 0.13,
              child: Container(
                width: 120,
                height: 155,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFF5F1FF), Color(0xFFDCD2FF)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 25,
                      offset: const Offset(10, 18),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.menu_book_rounded, size: 44, color: Color(0xFF6040E8)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
