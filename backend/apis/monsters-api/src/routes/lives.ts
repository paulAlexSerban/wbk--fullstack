import express, { Router, Request, Response, NextFunction } from 'express';
import { pool } from '../db';

const router: Router = express.Router();

/* GET */
router.get('/', (req: Request, res: Response, next: NextFunction) => {
    pool.query('SELECT * FROM lives', (err, dbRes) => {
        if (err) {
            return next(err);
        }

        res.send(dbRes.rows);
    });
});

router.get('/conditions', (req: Request, res: Response, next: NextFunction) => {
    pool.query('SELECT * FROM lives JOIN habitats ON habitats.name = lives.habitat', (err, dbRes) => {
        if (err) {
            return next(err);
        }

        res.send(dbRes.rows);
    });
});

/* POST */
router.post('/', (req: Request, res: Response, next: NextFunction) => {
    const { monster, habitat } = req.body;
    pool.query('INSERT INTO lives (monster, habitat) VALUES ($1, $2)', [monster, habitat], (err, dbRes) => {
        if (err) {
            return next(err);
        }

        res.send(dbRes.rows);
    });
});

export default router;
