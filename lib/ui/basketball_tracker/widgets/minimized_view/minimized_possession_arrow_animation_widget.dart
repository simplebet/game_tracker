import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_model/models/enums.dart';

import '../../../../store/game_tracker_skin_store.dart';
import '../../notifiers/possession_arrow_state_notifier.dart';
import '../../state_machines/minimized_view/minimized_possession_arrow_state_machine.dart';
import '../../util/constants.dart';
import '../transformations/half_court_perspective_builder.dart';
import '../transformations/mirror_transform.dart';

class MinimizedPossessionArrowAnimationWidget extends ConsumerStatefulWidget {
  const MinimizedPossessionArrowAnimationWidget({
    super.key,
  });

  @override
  ConsumerState<MinimizedPossessionArrowAnimationWidget> createState() =>
      _PossessionArrowAnimationWidgetState();
}

class _PossessionArrowAnimationWidgetState
    extends ConsumerState<MinimizedPossessionArrowAnimationWidget>
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
    final isAwayTeamSide = arrowState.courtSide == HomeOrAway.away;

    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return AnimatedOpacity(
      opacity: arrowState.showArrow ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      child: Stack(
        children: [
          /// possession arrow Rive animation
          MirrorTransform(
            doFlip: !isAwayTeamSide,
            child: const MinimizedPossessionArrowStateMachine(),
          ),

          /// possession arrow overlay text
          if (arrowState.arrowType != null)
            HalfCourtPerspectiveBuilder(
              isMinimizedView: true,
              isTextOverlay: true,
              isLeftSide: isAwayTeamSide,
              child: MirrorTransform(
                doFlip: !isAwayTeamSide,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: isAwayTeamSide ? 10 : 0,
                      right: isAwayTeamSide ? 0 : 10),
                  child: Align(
                    alignment: isAwayTeamSide
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Stack(
                      alignment: isAwayTeamSide
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      children: [
                        /// possession team text
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: arrowState.showReboundText ? 0 : 1,
                          child: Transform(
                            transform: possessionArrowTextMinimizedTransform,
                            child: AutoSizeText(
                              '${arrowState.teamName.toUpperCase()} POSS',
                              style: skin.textStyles.basketballHeader3Extrabold
                                  .copyWith(
                                      color: skin.colors.grey1,
                                      fontSize: 36,
                                      letterSpacing: 1.2),
                            ),
                          ),
                        ),

                        /// defensive/offensive rebound text
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: arrowState.arrowType !=
                                      PossessionArrowType.possession &&
                                  arrowState.showReboundText
                              ? 1
                              : 0,
                          child: Transform(
                            // Set 3D perspective
                            transform: reboundTextMinimizedTransform,
                            child: Text(
                              (arrowState.arrowType ==
                                          PossessionArrowType.offensiveRebound
                                      ? 'Offensive Rebound'
                                      : 'Defensive Rebound')
                                  .toUpperCase(),
                              style: skin.textStyles.basketballHeader3Extrabold
                                  .copyWith(
                                color: skin.colors.grey1,
                                fontSize: 21,
                              ),
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
