abstract class DarkThemeEvent{}

class SwitchThemeEvent extends DarkThemeEvent{
  bool isDark;

  SwitchThemeEvent(this.isDark);
}