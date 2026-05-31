import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_gradients.dart';

class AnimatedEditorialBackground extends StatefulWidget {
  const AnimatedEditorialBackground({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<AnimatedEditorialBackground> createState() =>
      _AnimatedEditorialBackgroundState();
}

class _AnimatedEditorialBackgroundState extends State<AnimatedEditorialBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AppGradients.pageBackground),
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                final double value = _controller.value;

                return Stack(
                  children: [
                    _AnimatedBlob(
                      size: 250,
                      color: AppColors.seaMistBlue.withValues(alpha: 0.56),
                      top: -70 + math.sin(value * math.pi) * 18,
                      left: -60 + value * 36,
                    ),
                    _AnimatedBlob(
                      size: 220,
                      color: AppColors.sandBeige.withValues(alpha: 0.42),
                      bottom: 70 + math.cos(value * math.pi) * 22,
                      right: -80 + value * 30,
                    ),
                    _AnimatedBlob(
                      size: 180,
                      color: AppColors.lightAquaBlue.withValues(alpha: 0.34),
                      top: 260 + math.sin(value * math.pi * 1.4) * 28,
                      right: 20 + value * 22,
                    ),
                    Positioned.fill(
                      child: CustomPaint(
                        painter: _WavePainter(progress: value),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Positioned.fill(child: widget.child),
        ],
      ),
    );
  }
}

class _AnimatedBlob extends StatelessWidget {
  const _AnimatedBlob({
    required this.size,
    required this.color,
    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  final double size;
  final Color color;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: IgnorePointer(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  const _WavePainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.tideBlue.withValues(alpha: 0.045)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;

    for (int i = 0; i < 4; i++) {
      final Path path = Path();
      final double baseY = size.height * (0.22 + i * 0.17);
      path.moveTo(0, baseY);

      for (double x = 0; x <= size.width; x += 12) {
        final double wave = math.sin((x / size.width * math.pi * 2) +
                (progress * math.pi * 2) +
                i) *
            9;
        path.lineTo(x, baseY + wave);
      }

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
