class RadioStation {
  final String title;
  bool isPlaying;
  bool isMuted;

  RadioStation({
    required this.title,
    this.isPlaying = false,
    this.isMuted = false,
  });
}
