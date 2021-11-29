class BaseProvider {
  BaseProvider({String? title}) {
    print(
      title ?? this.runtimeType.toString(),
    );
  }
}
