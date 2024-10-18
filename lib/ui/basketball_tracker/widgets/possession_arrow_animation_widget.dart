import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';
import '../notifiers/possession_arrow_state_notifier.dart';
import '../state_machines/possession_arrow_state_machine.dart';
import 'possession_text.dart';
import 'rebound_text.dart';
import 'transformations/half_court_perspective_builder.dart';
import 'transformations/mirror_transform.dart';

class PossessionArrowAnimationWidget extends ConsumerStatefulWidget {
  const PossessionArrowAnimationWidget({
    super.key,
    required this.maxWidth,
  });

  final double maxWidth;

  @override
  ConsumerState<PossessionArrowAnimationWidget> createState() =>
      _PossessionArrowAnimationWidgetState();
}

class _PossessionArrowAnimationWidgetState
    extends ConsumerState<PossessionArrowAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref
          .read(possessionArrowStateProvider.notifier)
          .initAnimationController(_animationController);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arrowState = ref.watch(possessionArrowStateProvider);

    return AnimatedOpacity(
      opacity: arrowState.showArrow ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      child: Stack(
        children: [
          MirrorTransform(
            doFlip: arrowState.courtSide == HomeOrAway.home,
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 3,
              ),
              child: PossessionArrowStateMachine(),
            ),
          ),
          HalfCourtPerspectiveBuilder(
            isLeftSide: arrowState.courtSide == HomeOrAway.away,
            child: MirrorTransform(
              doFlip: arrowState.courtSide == HomeOrAway.home,
              child: Align(
                alignment: arrowState.courtSide == HomeOrAway.away
                    ? Alignment.bottomLeft
                    : Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  child: Stack(
                    alignment: arrowState.courtSide == HomeOrAway.away
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    children: [
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: arrowState.showReboundText ? 0 : 1,
                        child: Transform(
                          // Set 3D perspective
                          transform: Matrix4.identity()
                            ..scale(1, .4)
                            ..translate(0.0, 60),

                          child: PossessionText(
                            teamName: arrowState.teamName,
                            textAlign: arrowState.courtSide == HomeOrAway.away
                                ? TextAlign.start
                                : TextAlign.end,
                            maxWidth: widget.maxWidth,
                          ),
                        ),
                      ),
                      if (arrowState.arrowType != null)
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: arrowState.arrowType !=
                                      PossessionArrowType.possession &&
                                  arrowState.showReboundText
                              ? 1
                              : 0,
                          child: Transform(
                            // Set 3D perspective
                            transform: Matrix4.identity()
                              ..scale(1, .6)
                              ..translate(0.0, 70),
                            child: ReboundText(
                              type: arrowState.arrowType,
                              courtSide: arrowState.courtSide,
                              maxWidth: widget.maxWidth,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
