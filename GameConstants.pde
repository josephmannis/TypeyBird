Random rand = new Random();

// Game State
boolean gameStarted = false;
boolean gameOver = false;

// Environment Variables:
int score;
int difficulty;
String goal;
String curr;
HashMap<Integer, Integer> difficultyFileLimits = new HashMap<Integer, Integer>();

// Bird Related
Bird b;
static float gravity  = .125;
static int birdSize = 20;
static float birdPosition = 100;
static double flapSpeed = -.03;

// Pillar Related
ArrayList<PillarSet> pillars; 
static int numPillars = 4;
static float pillarSpeed = 1.5;
static int maxGapSize = 200;
static int minGapSize = 100;
static int pillarWidth = 40;