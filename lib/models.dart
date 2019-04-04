
class AppState {
  bool isLoading;
  int currentPlayer = 0;
  final maxPlayers = 2;
  List<Player> players;
  LHero selectedOne;
  LHero selectedTwo;

  AppState({
    this.isLoading = false,
    this.players = const [],
  });

  void nextPlayer() {
    players[currentPlayer].isActive = false;
    currentPlayer+=1;
    currentPlayer%=maxPlayers;
    players[currentPlayer].isActive = true;
  }

  void select(LHero hero)
  { 
    hero.selected = true;
    if (selectedOne==null)
    {
      selectedOne = hero;
      return;
    }
    else if(selectedTwo==null)
    {
      selectedTwo = hero;
      return;
    }
    selectedOne.selected = false; 
    selectedOne=hero;

  }

  void attack()
  {
    selectedOne.attack(selectedTwo);
  }
  
  factory AppState.loading() => AppState(isLoading: true);

}



class Player {
  bool isActive;
  final playerName;
  List<LHero> heroes = List<LHero>();

  Player(this.playerName, this.isActive){

    heroes.add(Wizzard());
    heroes.add(Archer());

  }
}

enum DamageType{
  Phiscal, 
  Magic
}

abstract class LHero {
  int maxHealth;
  int currentHealth;
  DamageType damageType;
  int baseDamage;
  bool selected = false;
  LHero(this.maxHealth, this.damageType, this.baseDamage)
  {
    currentHealth=maxHealth;
  }

  void attack(LHero other)
  {
    other.currentHealth -= baseDamage;
  }
}


class Archer extends LHero {
  Archer(): super(1800, DamageType.Phiscal,350);
}


class Wizzard extends LHero {
  Wizzard(): super(1800, DamageType.Magic, 250);
}
