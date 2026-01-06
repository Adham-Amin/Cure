import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimatedRating extends StatefulWidget {
  const AnimatedRating({
    super.key,
    required this.acticeIcon,
    required this.inActiveIcon,
    required this.onChanged,
    required this.initialRating,
    this.animationDuration = const Duration(milliseconds: 1000),
  });

  final String acticeIcon;
  final int initialRating;
  final String inActiveIcon;
  final ValueChanged<int> onChanged;

  final Duration animationDuration;

  @override
  State<AnimatedRating> createState() => _AnimatedRatingState();
}

class _AnimatedRatingState extends State<AnimatedRating>
    with SingleTickerProviderStateMixin {
  late int _currentRating;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;

    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 1.3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _onTap(int rating) {
    setState(() {
      _currentRating = rating;
    });

    widget.onChanged(_currentRating);

    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final ratingValue = index + 1;
        final isActive = ratingValue <= _currentRating;
        return GestureDetector(
          onTap: () => _onTap(ratingValue),
          child: AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (_, child) {
              return Transform.scale(scale: 1, child: child);
            },
            child: AnimatedOpacity(
              duration: widget.animationDuration,
              opacity: isActive ? 1 : 0.2,
              child: SvgPicture.asset(
                isActive ? widget.acticeIcon : widget.inActiveIcon,
                width: 32,
                height: 32,
              ),
            ),
          ),
        );
      }),
    );
  }
}
