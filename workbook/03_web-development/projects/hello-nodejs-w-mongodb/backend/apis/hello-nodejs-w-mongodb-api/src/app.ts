import express, { Express, Request, Response, NextFunction } from "express";
import cookieParser from "cookie-parser";
import logger from "./middlewares/logger";
import errorHandler from "./middlewares/error";
import routes from "./routes";

import connectDB from "./config/database";

connectDB();

const app: Express = express();

// if (process.env.NODE_ENV === 'development') {
//     app.use(logger);
// }
app.use(logger);
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

app.use("/api", routes);

app.use(errorHandler);

export default app;
