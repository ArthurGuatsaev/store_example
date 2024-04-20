abstract class BaseFileReaderWorkerRepository {
  Future<String?> getFile();
  Future<void> writeFile();
}
