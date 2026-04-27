const path = require("node:path");
const express = require("express");
const { engine } = require("express-handlebars");
const { initializeDatabase, queries } = require("./storage");

const PORT = process.env.PORT || 3000;
const app = express();

initializeDatabase();

app.engine(
  "handlebars",
  engine({
    defaultLayout: "main",
  })
);
app.set("view engine", "handlebars");
app.set("views", path.join(__dirname, "views"));

app.use(express.static(path.join(__dirname, "public")));

app.get("/", (_req, res) => {
  const leaderboard = queries.getLeaderboard();
  res.render("leaderboard", {
    title: "Leaderboard",
    leaderboard,
  });
});

app.get("/users", (_req, res) => {
  const users = queries.getUsers();
  res.render("users", {
    title: "Users",
    users,
  });
});

app.get("/users/:id", (req, res) => {
  const user = queries.getUserById(Number(req.params.id));

  if (!user) {
    res.status(404).render("not-found", {
      title: "User Not Found",
      message: `No user found with id ${req.params.id}`,
    });
    return;
  }

  res.render("user-profile", {
    title: `${user.firstName} ${user.lastName}`,
    user,
  });
});

app.get("/api/leaderboard", (_req, res) => {
  const leaderboard = queries.getLeaderboard();
  res.json({
    entries: leaderboard,
    lastUpdated: new Date().toISOString(),
  });
});

app.get("/api/users", (_req, res) => {
  const users = queries.getUsers();
  res.json(users);
});

app.listen(PORT, () => {
  console.log(`Leaderboard SSR service listening on port ${PORT}`);
});
