enum NetworkPath {
  product(path: "/products"),
  category(path:"/categories");

  const NetworkPath(
    {
      required this.path
    }
  );
  final String path;
}