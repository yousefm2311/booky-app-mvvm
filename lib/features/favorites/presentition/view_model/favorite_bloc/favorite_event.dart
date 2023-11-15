abstract class FavoriteEvent {}

class FetchFavoriteDataEvent extends FavoriteEvent {}

class RemoveFavoriteDataEvent extends FavoriteEvent {
  final String id;
  RemoveFavoriteDataEvent({required this.id});
}
