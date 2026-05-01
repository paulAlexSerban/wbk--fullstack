import { Request, Response, NextFunction } from "express";

import catchAsyncErrors from "../middlewares/catchAsyncErrors";
import Hello from "../models/HelloMongoSchema";

export const createHello = catchAsyncErrors(
  async (req: Request, res: Response, next: NextFunction) => {
    const { name } = req.body;
    const hello = await Hello.create({ name });
    res.status(200).json({
      success: true,
      method: req.method,
      message: `Hello, ${name}! Created`,
      data: hello,
    });
  }
);


export const retrieveHello = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  res.json({
    method: req.method,
    message: "Hello, worlds!",
  });
};

export const updateHello = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const id = req.params.id;
  const { name } = req.body;
  res.json({
    method: req.method,
    message: `Hello, ${name}!`,
    id: id,
  });
};

export const modifyHello = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const id = req.params.id;
  const { name } = req.body;
  res.json({
    method: req.method,
    message: `Hello, ${name}!`,
    id: id,
  });
};

export const deleteHello = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const id = req.params.id;
  res.json({
    method: req.method,
    id: id,
  });
};
