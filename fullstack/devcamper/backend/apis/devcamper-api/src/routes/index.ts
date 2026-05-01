import express, { Router } from "express";

import bootcampsRouter from "./v1/bootcamps-route";
import bootcampRouter from "./v1/bootcamp-route";

const router: Router = express.Router();

router.use("/v1/bootcamps", bootcampsRouter);
router.use("/v1/bootcamp", bootcampRouter);

export default router;
