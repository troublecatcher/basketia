String formatSecondsToMinSec(int seconds) {
  int minutes = seconds ~/ 60;
  int remainingSeconds = seconds % 60;

  String minutesString = (minutes < 10) ? '0$minutes' : '$minutes';
  String secondsString =
      (remainingSeconds < 10) ? '0$remainingSeconds' : '$remainingSeconds';

  return '$minutesString:$secondsString';
}
