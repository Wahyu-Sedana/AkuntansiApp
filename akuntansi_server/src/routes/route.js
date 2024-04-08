import user_controller from "../controllers/user_controller.js";
import express from 'express';

const router = express.Router();

router.post('/login', user_controller.loginUser);
router.post('/register', user_controller.registerUser);

export default router;