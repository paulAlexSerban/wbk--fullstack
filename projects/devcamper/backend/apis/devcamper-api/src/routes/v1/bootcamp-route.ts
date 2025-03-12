import express, { Router, Request, Response } from "express";
import {
  getBootcamp,
  updateBootcamp,
  patchBootcamp,
  deleteBootcamp,
} from "../../controllers/bootcamp-controller";

const router: Router = express.Router();

router.get("/:id", getBootcamp);
router.put("/:id", updateBootcamp);
router.patch("/:id", patchBootcamp);
router.delete("/:id", deleteBootcamp);

export default router;
