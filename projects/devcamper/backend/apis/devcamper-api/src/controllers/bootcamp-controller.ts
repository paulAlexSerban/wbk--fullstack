import { Request, Response, NextFunction } from "express";


export const getBootcamp = (req: Request, res: Response, next: NextFunction) => {
    const id = req.params.id;
    res.status(200).json({
      method: req.method,
      message: "Get bootcamp by id!",
      id
    });
  };

export const updateBootcamp = (req: Request, res: Response, next: NextFunction) => {
    const id = req.params.id;
    const { name } = req.body;
    res.status(200).json({
      method: req.method,
      message: `Update bootcamp, ${name}!`,
      id
    });
  }

export const patchBootcamp = (req: Request, res: Response, next: NextFunction) => {
    const id = req.params.id;
    const { name } = req.body;
    res.status(200).json({
      method: req.method,
      message: `Patch bootcamp, ${name}!`,
      id
    });
  }

export const deleteBootcamp = (req: Request, res: Response, next: NextFunction) => {
    const id = req.params.id;
    res.status(200).json({
      method: req.method,
      message: `Delete bootcamp!`,
      id
    });
  }