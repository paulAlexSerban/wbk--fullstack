import { Request, Response, NextFunction } from "express";

/**
 * GET all bootcamps
 * @desc   Get all bootcamps
 * @route  GET /api/v1/bootcamps
 * @access Public
 */
export const getBootcamps = (
  req: Request,
  res: Response
) => {
  res.status(200).json({
    method: req.method,
    message: "Show all bootcamps!",
  });
};


/**
 * POST create bootcamp
 * @desc   Create new bootcamp
 * @route  POST /api/v1/bootcamps
 * @access Private
 */
export const createBootcamp = (
  req: Request,
  res: Response
) => {
  const { name } = req.body;
  res.status(201).json({
    method: req.method,
    message: `Create new bootcamp, ${name}!`,
  });
};
