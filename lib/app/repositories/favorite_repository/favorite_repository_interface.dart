abstract class IFavoriteRepositoryInterface {
  Future<void> createFavoritesIfNotExists();
  Future<void> addToFavorites(String uid);
  Future<void> getFromFavorites(String uid);
  Future<void> removeFromFavorites(String uid);
}
