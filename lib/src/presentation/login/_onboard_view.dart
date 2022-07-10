part of 'login_screen.dart';

class _OnBoardView extends StatelessWidget {
  const _OnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LottieBuilder.asset(LottieAssets.onBoard, width: 300),
        const SizedBox(height: 16.0),
        Text(
          Strings.onBoardMessage,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        )
      ],
    );
  }
}
