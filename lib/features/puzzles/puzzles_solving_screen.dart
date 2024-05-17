import 'package:basketia/features/puzzles/helper.dart';
import 'package:basketia/features/puzzles/image_splitter.dart';
import 'package:basketia/features/puzzles/tile.dart';
import 'package:basketia/features/puzzles/timer.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_route/auto_route.dart';
import 'package:basketia/features/puzzles/puzzles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

@RoutePage()
class PuzzlesSolvingScreen extends StatefulWidget {
  final Puzzle puzzle;
  const PuzzlesSolvingScreen({super.key, required this.puzzle});

  @override
  PuzzlesSolvingScreenState createState() => PuzzlesSolvingScreenState();
}

class PuzzlesSolvingScreenState extends State<PuzzlesSolvingScreen> {
  late ConfettiController confettiController;
  List<Image> _images = [];
  List<Tile> _tiles = [];
  bool gameInProgress = false;
  bool showPicture = false;
  bool tileMoving = false;
  final int gridSize = 4;

  @override
  void initState() {
    super.initState();
    ImageSplitter.initializeImagesAndTiles(
            widget.puzzle.assetName, gridSize, gridSize)
        .then((value) {
      if (!mounted) {
        return;
      }
      _images = value;
      _tiles = List.generate(
        gridSize * gridSize,
        (index) {
          return Tile(
            empty: index == 0,
            row: index ~/ gridSize,
            col: index % gridSize,
            initRow: index ~/ gridSize,
            initCol: index % gridSize,
            image: _images[index],
          );
        },
      );
      setState(() {});
    });
    confettiController =
        ConfettiController(duration: const Duration(milliseconds: 800));
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width - 32.w - 4;
    return Consumer(
      builder: (context, ref, child) {
        final timerState = ref.watch(timerProvider);
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            forceMaterialTransparency: true,
            backgroundColor: Colors.transparent,
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                ref.read(timerProvider.notifier).stop();
                ref.read(timerProvider.notifier).nullify();
                context.router.popForced();
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
            title: Text(
              formatSecondsToMinSec(timerState),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            actions: [
              gameInProgress
                  ? CupertinoButton(
                      onPressed: () =>
                          setState(() => showPicture = !showPicture),
                      child: SvgPicture.asset(
                        'assets/icons/misc/eye.svg',
                        colorFilter: ColorFilter.mode(
                          showPicture
                              ? Colors.white
                              : Theme.of(context).disabledColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          body: Stack(
            children: [
              Image.asset(
                widget.puzzle.assetName,
                width: size.width * 2,
                height: size.height,
                fit: BoxFit.cover,
              ),
              Container(color: Colors.black.withOpacity(0.8)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedCrossFade(
                    firstChild: Align(
                      alignment: Alignment.center,
                      child: Hero(
                        tag: widget.puzzle.assetName,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Image.asset(widget.puzzle.assetName),
                        ),
                      ),
                    ),
                    secondChild: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      height: w,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: Stack(
                          children: List.generate(
                            _tiles.length,
                            (index) {
                              final tile = _tiles[index];
                              return AnimatedPositioned(
                                curve: Curves.easeInOut,
                                duration: const Duration(milliseconds: 200),
                                top: w * tile.row / gridSize,
                                left: w * tile.col / gridSize,
                                child: GestureDetector(
                                  onTap: gameInProgress
                                      ? () => _moveTile(tile, ref)
                                      : null,
                                  child: AnimatedContainer(
                                    curve: Curves.easeInOut,
                                    duration: const Duration(milliseconds: 500),
                                    height: w / gridSize,
                                    width: w / gridSize,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      border: gameInProgress
                                          ? Border.all(width: 2)
                                          : null,
                                    ),
                                    child: gameInProgress
                                        ? (tile.empty
                                            ? const SizedBox.shrink()
                                            : tile.image)
                                        : tile.image,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    crossFadeState: _tiles.isEmpty || showPicture
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 200),
                  ),
                  SizedBox(height: 16.h),
                  AnimatedCrossFade(
                    firstChild: const SizedBox.shrink(),
                    secondChild: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CupertinoButton(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(12.r),
                                  onPressed: _tiles.isEmpty
                                      ? null
                                      : () {
                                          _shuffle();
                                          ref
                                              .read(timerProvider.notifier)
                                              .start();
                                        },
                                  child: _tiles.isEmpty
                                      ? const CupertinoActivityIndicator()
                                      : Text(
                                          'Shuffle!',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: Colors.white),
                                        ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Text(
                              'Tap on cells adjacent to the empty one to swap them',
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    crossFadeState: gameInProgress
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 200),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: confettiController,
                  blastDirection: pi / 2,
                  numberOfParticles: 20,
                  emissionFrequency: 0.5,
                  blastDirectionality: BlastDirectionality.explosive,
                  gravity: 0.3,
                  colors: [
                    Theme.of(context).primaryColor,
                  ],
                  shouldLoop: false,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _shuffle() async {
    setState(() {
      gameInProgress = true;
    });
    await Future.delayed(const Duration(milliseconds: 600)).then((value) {
      shuffleTiles();
    });
  }

  void shuffleTiles() {
    final random = Random();

    for (int i = 0; i < _tiles.length; i++) {
      final randomIndex1 = random.nextInt(_tiles.length);
      final randomIndex2 = random.nextInt(_tiles.length);

      final tempRow = _tiles[randomIndex1].row;
      final tempCol = _tiles[randomIndex1].col;

      _tiles[randomIndex1].row = _tiles[randomIndex2].row;
      _tiles[randomIndex1].col = _tiles[randomIndex2].col;

      _tiles[randomIndex2].row = tempRow;
      _tiles[randomIndex2].col = tempCol;
    }

    setState(() {});
  }

  Future<void> _moveTile(Tile tile, WidgetRef ref) async {
    final emptyTile = _tiles.firstWhere((element) => element.empty);
    final rowDiff = (tile.row - emptyTile.row).abs();
    final colDiff = (tile.col - emptyTile.col).abs();

    if ((rowDiff == 1 && colDiff == 0) || (colDiff == 1 && rowDiff == 0)) {
      if (!mounted) {
        return;
      }
      setState(() {
        final tempRow = tile.row;
        final tempCol = tile.col;
        tile.row = emptyTile.row;
        tile.col = emptyTile.col;
        emptyTile.row = tempRow;
        emptyTile.col = tempCol;
      });
      _checkForWin(ref);
    }
  }

  void _checkForWin(WidgetRef ref) {
    bool isWin = true;
    for (final tile in _tiles) {
      if (tile.row != tile.initRow || tile.col != tile.initCol) {
        isWin = false;
        break;
      }
    }
    if (isWin) {
      if (!mounted) {
        return;
      }
      setState(() {
        gameInProgress = false;
        ref.read(timerProvider.notifier).stop();
        confettiController.play();
      });
    }
  }
}
