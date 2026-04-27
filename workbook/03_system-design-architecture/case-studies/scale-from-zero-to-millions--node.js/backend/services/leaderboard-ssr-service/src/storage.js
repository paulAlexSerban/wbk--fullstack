const fs = require("node:fs");
const path = require("node:path");
const { DatabaseSync } = require("node:sqlite");

const dbPath = process.env.DB_PATH || path.join(__dirname, "..", "data", "leaderboard.sqlite");

const seedUsers = [
  {
    id: 1,
    name: "Leanne Graham",
    score: 980,
    firstName: "Leanne",
    lastName: "Graham",
    address: "Kulas Light, Gwenborough",
    email: "leanne@example.com",
    phone: "1-770-736-8031",
    website: "hildegard.org",
    company: "Romaguera-Crona",
  },
  {
    id: 2,
    name: "Ervin Howell",
    score: 910,
    firstName: "Ervin",
    lastName: "Howell",
    address: "Victor Plains, Wisokyburgh",
    email: "ervin@example.com",
    phone: "010-692-6593",
    website: "anastasia.net",
    company: "Deckow-Crist",
  },
  {
    id: 3,
    name: "Clementine Bauch",
    score: 890,
    firstName: "Clementine",
    lastName: "Bauch",
    address: "Douglas Extension, McKenziehaven",
    email: "clementine@example.com",
    phone: "1-463-123-4447",
    website: "ramiro.info",
    company: "Romaguera-Jacobson",
  },
  {
    id: 4,
    name: "Patricia Lebsack",
    score: 860,
    firstName: "Patricia",
    lastName: "Lebsack",
    address: "Hoeger Mall, South Elvis",
    email: "patricia@example.com",
    phone: "493-170-9623",
    website: "kale.biz",
    company: "Robel-Corkery",
  },
  {
    id: 5,
    name: "Chelsey Dietrich",
    score: 825,
    firstName: "Chelsey",
    lastName: "Dietrich",
    address: "Skiles Walks, Roscoeview",
    email: "chelsey@example.com",
    phone: "(254)954-1289",
    website: "demarco.info",
    company: "Keebler LLC",
  },
  {
    id: 6,
    name: "Mrs. Dennis Schulist",
    score: 790,
    firstName: "Denise",
    lastName: "Schulist",
    address: "Norberto Crossing, South Christy",
    email: "denise@example.com",
    phone: "1-477-935-8478",
    website: "ola.org",
    company: "Considine-Lockman",
  },
  {
    id: 7,
    name: "Kurtis Weissnat",
    score: 760,
    firstName: "Kurtis",
    lastName: "Weissnat",
    address: "Rex Trail, Howemouth",
    email: "kurtis@example.com",
    phone: "210.067.6132",
    website: "elvis.io",
    company: "Johns Group",
  },
  {
    id: 8,
    name: "Nicholas Runolfsdottir",
    score: 735,
    firstName: "Nicholas",
    lastName: "Runolfsdottir",
    address: "Ellsworth Summit, Aliyaview",
    email: "nicholas@example.com",
    phone: "586.493.6943",
    website: "jacynthe.com",
    company: "Abernathy Group",
  },
  {
    id: 9,
    name: "Glenna Reichert",
    score: 700,
    firstName: "Glenna",
    lastName: "Reichert",
    address: "Dayna Park, Bartholomebury",
    email: "glenna@example.com",
    phone: "(775)976-6794",
    website: "conrad.com",
    company: "Yost and Sons",
  },
  {
    id: 10,
    name: "Clementina DuBuque",
    score: 670,
    firstName: "Clementina",
    lastName: "DuBuque",
    address: "Kattie Turnpike, Lebsackbury",
    email: "clementina@example.com",
    phone: "024-648-3804",
    website: "ambrose.net",
    company: "Hoeger LLC",
  },
];

let db;

function getDb() {
  if (!db) {
    fs.mkdirSync(path.dirname(dbPath), { recursive: true });
    db = new DatabaseSync(dbPath);
    db.exec("PRAGMA foreign_keys = ON;");
  }

  return db;
}

function initializeDatabase() {
  const database = getDb();

  database.exec(`
    CREATE TABLE IF NOT EXISTS users (
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      score INTEGER NOT NULL,
      first_name TEXT NOT NULL,
      last_name TEXT NOT NULL,
      address TEXT NOT NULL,
      email TEXT NOT NULL,
      phone TEXT NOT NULL,
      website TEXT NOT NULL,
      company TEXT NOT NULL
    );

    CREATE TABLE IF NOT EXISTS leaderboard_entries (
      user_id INTEGER PRIMARY KEY,
      score INTEGER NOT NULL,
      rank INTEGER NOT NULL,
      FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
    );
  `);

  const userCount = database.prepare("SELECT COUNT(*) AS count FROM users").get().count;

  if (userCount === 0) {
    const insertUser = database.prepare(`
      INSERT INTO users (id, name, score, first_name, last_name, address, email, phone, website, company)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `);

    const insertLeaderboardEntry = database.prepare(`
      INSERT INTO leaderboard_entries (user_id, score, rank)
      VALUES (?, ?, ?)
    `);

    database.exec("BEGIN TRANSACTION;");

    try {
      seedUsers
        .sort((a, b) => b.score - a.score)
        .forEach((user, index) => {
          insertUser.run(
            user.id,
            user.name,
            user.score,
            user.firstName,
            user.lastName,
            user.address,
            user.email,
            user.phone,
            user.website,
            user.company
          );

          insertLeaderboardEntry.run(user.id, user.score, index + 1);
        });

      database.exec("COMMIT;");
    } catch (error) {
      database.exec("ROLLBACK;");
      throw error;
    }
  }
}

const queries = {
  getLeaderboard() {
    return getDb()
      .prepare(`
        SELECT
          le.user_id AS userId,
          u.name,
          le.score,
          le.rank
        FROM leaderboard_entries le
        JOIN users u ON u.id = le.user_id
        ORDER BY le.rank ASC
      `)
      .all();
  },

  getUsers() {
    return getDb()
      .prepare(`
        SELECT
          id,
          name,
          score,
          first_name AS firstName,
          last_name AS lastName,
          address,
          email,
          phone,
          website,
          company
        FROM users
        ORDER BY id ASC
      `)
      .all();
  },

  getUserById(id) {
    return getDb()
      .prepare(`
        SELECT
          id,
          name,
          score,
          first_name AS firstName,
          last_name AS lastName,
          address,
          email,
          phone,
          website,
          company,
          (
            SELECT rank
            FROM leaderboard_entries
            WHERE user_id = users.id
          ) AS rank
        FROM users
        WHERE id = ?
      `)
      .get(id);
  },
};

module.exports = {
  initializeDatabase,
  queries,
};
