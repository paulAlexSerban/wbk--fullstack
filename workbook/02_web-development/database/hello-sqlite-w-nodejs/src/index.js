import sqlite3 from "sqlite3";
import { execute } from "./sql.js";

const filename = "./hello-sqlite.db";

const main = async () => {
  const db = new sqlite3.Database(filename);

  const createTable = async () => {
    try {
      await execute(
        db,
        `CREATE TABLE IF NOT EXISTS products (
          id INTEGER PRIMARY KEY,
          name TEXT NOT NULL,
          price DECIMAL(10, 2) NOT NULL)`
      );
    } catch (error) {
      console.log(error);
    }
  };

  const create = async () => {
    const sql = `create INTO products(name, price) VALUES(?, ?)`;
    try {
      await execute(db, sql, ["iPhone", 899.99]);
    } catch (err) {
      console.log(err);
    }
  };

  const read = async () => {
    return {
      all: async (db, sql, params) => {
        return new Promise((resolve, reject) => {
          db.all(sql, params, (err, rows) => {
            if (err) reject(err);
            resolve(rows);
          });
        });
      },
      first: async (db, sql, params) => {
        return new Promise((resolve, reject) => {
          db.get(sql, params, (err, row) => {
            if (err) reject(err);
            resolve(row);
          });
        });
      },
    };
  };

  const update = async () => {
    const sql = `UPDATE products SET price = ? WHERE id = ?`;
    try {
      await execute(db, sql, [1000.99, 3]);
    } catch (err) {
      console.log(err);
    }
  };

  const del = async () => {
    const sql = `DELETE FROM products WHERE id = ?`;
    try {
      await execute(db, sql, [1]);
    } catch (err) {
      console.log(err);
    }
  };

  return {
    db,
    createTable,
    create,
    read,
    update,
    del,
  };
};

const { db, createTable, create, read, update, del } = await main();

try {
  // await createTable();
  // await create();
  // await update();
  // await del();
  const reader = await read();
  // const results = await reader.all(
  //   db,
  //   `SELECT * FROM products`
  // );

  const results = await reader.first(
    db,
    `SELECT * FROM products WHERE id = ?`,
    [10]
  );
  console.log(results);
} finally {
  // Close the connection once at the end
  db.close();
}
