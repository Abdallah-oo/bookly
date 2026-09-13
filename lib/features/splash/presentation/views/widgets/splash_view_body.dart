import 'package:bookly/core/routing/routes.dart';
import 'package:bookly/features/splash/presentation/views/widgets/bookly_logo.dart';
import 'package:bookly/features/splash/presentation/views/widgets/floating_book.dart';
import 'package:bookly/features/splash/presentation/views/widgets/start_botton.dart';
import 'package:bookly/features/splash/presentation/views/widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _bookAnimation;
  late final Animation<double> _logoAnimation;
  late final Animation<double> _textAnimation;
  late final Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800));

    _bookAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.55, curve: Curves.easeOutBack),
    );

    _logoAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.15, 0.60, curve: Curves.easeOutCubic),
    );

    _textAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.35, 0.80, curve: Curves.easeOutCubic),
    );

    _buttonAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.55, 1.0, curve: Curves.easeOutCubic),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startReading() {
    context.pushReplacement(Routes.kHome);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF101827), Color(0xFF0B1220), Color(0xFF050A12)],
        ),
      ),
      child: Stack(
        children: [
          const _BackgroundGlow(),

          SafeArea(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Column(
                  children: [
                    const SizedBox(height: 35),

                    FadeTransition(
                      opacity: _logoAnimation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, -0.25),
                          end: Offset.zero,
                        ).animate(_logoAnimation),
                        child: const BooklyLogo(),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        children: [
                          const Spacer(),

                          ScaleTransition(
                            scale: Tween<double>(begin: 0.65, end: 1.0).animate(_bookAnimation),
                            child: FadeTransition(
                              opacity: _bookAnimation,
                              child: const FloatingBook(),
                            ),
                          ),

                          const SizedBox(height: 42),

                          FadeTransition(
                            opacity: _textAnimation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 0.18),
                                end: Offset.zero,
                              ).animate(_textAnimation),
                              child: const WelcomeText(),
                            ),
                          ),

                          const Spacer(),

                          FadeTransition(
                            opacity: _buttonAnimation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 0.3),
                                end: Offset.zero,
                              ).animate(_buttonAnimation),
                              child: StartButton(onPressed: _startReading),
                            ),
                          ),

                          const SizedBox(height: 18),

                          FadeTransition(
                            opacity: _buttonAnimation,
                            child: const Text(
                              'Your next chapter starts here.',
                              style: TextStyle(
                                color: Color(0xFF6F7B8F),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.4,
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundGlow extends StatelessWidget {
  const _BackgroundGlow();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -120,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF8B5CF6).withValues(alpha: 0.10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF8B5CF6).withValues(alpha: 0.14),
                    blurRadius: 120,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -160,
            left: -120,
            child: Container(
              width: 340,
              height: 340,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF2563EB).withValues(alpha: 0.08),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2563EB).withValues(alpha: 0.12),
                    blurRadius: 140,
                    spreadRadius: 60,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
