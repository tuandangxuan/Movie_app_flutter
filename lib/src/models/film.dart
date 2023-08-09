class Film{
  String name;
  double rate;
  List<String> actions ;
  String description;
  var image;

  Film(this.name, this.rate, this.actions, this.description, this.image);

  @override
  String toString() => 'name : $name , rate : $rate';
}