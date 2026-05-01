import express, { Router } from "express";
import helloRouter from "./hello";

const router: Router = express.Router();

router.use("/hello", helloRouter);

export default router;
