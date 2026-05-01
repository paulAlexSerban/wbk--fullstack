import sqlite3 from "sqlite3";
const { Database } = sqlite3;

/**
 * Function to execute a SQL statement
 *
 * @param {Database} db
 * @param {String} sql
 * @param {String[]} params
 * @returns
 */
export const execute = async (db, sql, params = []) => {
  if (params && params.length > 0) {
    return new Promise((resolve, reject) => {
      db.run(sql, params, (err) => {
        if (err) reject(err);
        resolve();
      });
    });
  }
  return new Promise((resolve, reject) => {
    db.exec(sql, (err) => {
      if (err) reject(err);
      resolve();
    });
  });
};
