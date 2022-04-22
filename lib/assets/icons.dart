class HeroIcon{
  const HeroIcon._(this.name);
  final String name;

  static const moon = HeroIcon._("moon");
  static const sun = HeroIcon._("sun");
  static const eye = HeroIcon._("eye");
  static const eye_off = HeroIcon._("eye_off");
  @override
  String toString() {
    return name;
  }
}