import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/game_tracker_screen_controller.dart';

class MatchSelectionScreen extends ConsumerStatefulWidget {
  const MatchSelectionScreen({super.key});

  @override
  ConsumerState<MatchSelectionScreen> createState() =>
      _MatchSelectionScreenState();
}

class _MatchSelectionScreenState extends ConsumerState<MatchSelectionScreen> {
  late GameTrackerScreenController controller;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller = ref.watch(gameTrackerScreenControllerProvider.notifier);
      controller.fetchMatchesByLeague(SportLeague.cfb);
      // todo: setup incidentStreamController listener
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(gameTrackerScreenControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  controller.fetchMatchesByLeague(SportLeague.cfb);
                },
                child: Text(
                  'CFB',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: state.league?.displayedTitle == 'CFB'
                          ? Colors.black
                          : Colors.grey),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.fetchMatchesByLeague(SportLeague.nfl);
                },
                child: Text('NFL',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: state.league?.displayedTitle == 'NFL'
                            ? Colors.black
                            : Colors.grey)),
              ),
              GestureDetector(
                onTap: () {
                  controller.fetchMatchesByLeague(SportLeague.nba);
                },
                child: Text('NBA',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: state.league?.displayedTitle == 'NBA'
                            ? Colors.black
                            : Colors.grey)),
              ),
              GestureDetector(
                onTap: () {
                  controller.fetchMatchesByLeague(SportLeague.cbb);
                },
                child: Text('CBB',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: state.league?.displayedTitle == 'CBB'
                            ? Colors.black
                            : Colors.grey)),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        if (state.allMatches != null && state.allMatches!.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemCount: state.allMatches?.length,
              itemBuilder: (_, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.grey.withOpacity(0.5)))),
                  child: GestureDetector(
                    onTap: () {
                      print(state.allMatches?[index].id);
                      // controller.subscribeToMatch(state.allMatches?[index].id ?? '');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  state.allMatches?[index].awayTeam?.logoUrl ??
                                      '',
                              width: 30,
                              height: 30,
                            ),
                            Text(state.allMatches?[index].awayTeam?.shortName ??
                                ''),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: Text('VS',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                            ),
                            Text(state.allMatches?[index].homeTeam?.shortName ??
                                ''),
                            CachedNetworkImage(
                              imageUrl:
                                  state.allMatches?[index].homeTeam?.logoUrl ??
                                      '',
                              width: 30,
                              height: 30,
                            ),
                          ],
                        ),
                        Text(state.allMatches?[index].id ?? ''),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        else
          const Text('No active matches'),
      ],
    );
  }
}
