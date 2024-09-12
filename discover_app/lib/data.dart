class Article {
  final String title;
  final String image;
  final String location;
  final String author;
  final int likes;
  final int comments;
  final int shares;
  double rating;
  bool isLiked = false;

  Article(this.title, this.image, this.comments, this.likes, this.isLiked,
      this.location, this.shares, this.author, this.rating);
}

List<Article> articles = [
  Article(
      'Japan\'s second largest metropolitan area',
      'https://images.unsplash.com/photo-1555400038-63f5ba517a47?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      100,
      32000,
      true,
      'Osaka Japan',
      50,
      'Hussain Mustafa',
      4),
  Article(
      'Known as the sleepless town for obvious reasons',
      'https://images.unsplash.com/photo-1517154868524-c6b5fbd62a1c?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      300,
      50000,
      true,
      'Kabuikicho Japan',
      1250,
      'Tim Salvatore',
      3.5),
  Article(
      'Japan\'s second largest metropolitan area',
      'https://plus.unsplash.com/premium_photo-1666432045848-3fdbb2c74531?q=80&w=1032&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      200,
      10000,
      true,
      'Tokyo Japan',
      1000,
      'Ely Marya',
      5),
];
