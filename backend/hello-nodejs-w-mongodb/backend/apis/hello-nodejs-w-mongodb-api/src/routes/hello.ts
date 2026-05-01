import express, { Router } from "express";
import {
  retrieveHello,
  createHello,
  updateHello,
  modifyHello,
  deleteHello,
} from "../controllers/hello-controller";

const router: Router = express.Router();

router.get("/", retrieveHello);
router.post("/", createHello);
router.put("/:id", updateHello);
router.patch("/:id", modifyHello);
router.delete("/:id", deleteHello);

export default router;
