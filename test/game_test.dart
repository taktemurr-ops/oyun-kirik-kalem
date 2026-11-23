import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kirik_kalem/oyun_kirik_kalem.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kirikKalemConfig.title.length, 33);
    expect(kirikKalemConfig.tagline.length, 33);
    for (final s in kirikKalemConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kirikKalemConfig.gameId, kirikKalemId);
    expect(kirikKalemRules.gameId, kirikKalemId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kirikKalemRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kirikKalemId, optionalMechanics: kirikKalemRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kirikKalemRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
