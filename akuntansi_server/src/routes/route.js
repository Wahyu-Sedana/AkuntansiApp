import user_controller from "../controllers/user_controller.js";
import currency_controller from "../controllers/currency_controller.js";
import express from 'express';

const router = express.Router();

router.post('/login', user_controller.loginUser);
router.post('/register', user_controller.registerUser);
router.get('/currency', currency_controller.currency);

export default router;