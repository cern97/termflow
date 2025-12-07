// flashcard_data.dart

// 1. Veri Modeli
class Flashcard {
  final String term;       // Ön yüz: Kelime (Örn: Container)
  final String definition; // Arka yüz: Tanım
  final String example;    // Arka yüz: Örnek Cümle
  
  Flashcard({
    required this.term, 
    required this.definition,
    required this.example, 
  });
}

// 2. Örnek Veriler (Firebase'e geçene kadar burayı kullanacağız)
final Map<String, List<Flashcard>> flashcardsData = {
  
  'Data Structures': [
    Flashcard(
      term: 'Array', 
      definition: 'A collection of items stored at contiguous memory locations.',
      example: 'We used an array to store the daily temperature readings.'
    ),
    Flashcard(
      term: 'Stack', 
      definition: 'A linear data structure which follows a particular order: LIFO (Last In First Out).',
      example: ' The "Undo" feature in text editors is typically implemented using a stack.'
    ),
    Flashcard(
      term: 'Queue', 
      definition: 'A linear structure which follows a particular order: FIFO (First In First Out).',
      example: 'Printer tasks are handled in a queue; the first document sent is printed first.'
    ),
  ],

  'Algorithms': [
    Flashcard(
      term: 'Sorting', 
      definition: 'Arranging data in a particular format, such as ascending or descending order.',
      example: 'QuickSort is often faster than Bubble Sort for large datasets.'
    ),
    Flashcard(
      term: 'Recursion', 
      definition: 'A method where the solution depends on solutions to smaller instances of the same problem.',
      example: 'Calculating the factorial of a number is a classic example of recursion.'
    ),
  ],

  'Git': [
    Flashcard(
      term: 'Commit', 
      definition: 'A snapshot of your repository at a specific point in time.',
      example: 'Make sure to commit your changes before switching branches.'
    ),
    Flashcard(
      term: 'Merge', 
      definition: 'Joining two or more development histories together.',
      example: 'After the code review, we will merge the feature branch into main.'
    ),
    Flashcard(
      term: 'Clone', 
      definition: 'Creates a copy of an existing repository into a new directory.',
      example: 'I need to clone the repo to my local machine to start working.'
    ),
  ],

  'Docker': [
    Flashcard(
      term: 'Container', 
      definition: 'A standard unit of software that packages up code and all its dependencies.',
      example: 'The app works on my machine because it runs in a Docker container.'
    ),
    Flashcard(
      term: 'Image', 
      definition: 'A read-only template with instructions for creating a Docker container.',
      example: 'We pushed the new version of the Docker image to Docker Hub.'
    ),
    Flashcard(
      term: 'Dockerfile', 
      definition: 'A text document that contains all the commands to assemble an image.',
      example: 'You need to expose port 80 in the Dockerfile.'
    ),
  ],

  'Kubernetes': [
    Flashcard(
      term: 'Pod', 
      definition: 'The smallest deployable units of computing that you can create and manage in Kubernetes.',
      example: 'If a pod crashes, Kubernetes will automatically restart it.'
    ),
    Flashcard(
      term: 'Node', 
      definition: 'A worker machine in Kubernetes which may be a VM or physical machine.',
      example: 'We added two more nodes to the cluster to handle the traffic.'
    ),
  ],

  'SQL': [
    Flashcard(
      term: 'SELECT', 
      definition: 'Statement used to select data from a database.',
      example: 'SELECT * FROM users WHERE active = 1;'
    ),
    Flashcard(
      term: 'Primary Key', 
      definition: 'A unique identifier for a record in a table.',
      example: 'The UserID column serves as the primary key for the Users table.'
    ),
  ],
};
// Bilinmeyen (Sola kaydırılan) kartlar listesi
final List<Flashcard> unknownTerms = [];

// Bilinen (Sağa kaydırılan) kartlar listesi
final List<Flashcard> knownTerms = [];