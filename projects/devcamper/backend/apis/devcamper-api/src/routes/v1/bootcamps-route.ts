import express, { Router, Request, Response } from "express";
import { getBootcamps, createBootcamp } from "../../controllers/bootcamps-controller";
const router: Router = express.Router();

router.get("/", getBootcamps);
router.post("/", createBootcamp);

export default router;
