import user_controller from "../controllers/user_controller.js";
import currency_controller from "../controllers/currency_controller.js";
import transaction_controller from "../controllers/transaksi/transaksi_controller.js";
import kategori_controller from "../controllers/kategori/kategori_controller.js";
import express from 'express';

const router = express.Router();

router.post('/login', user_controller.loginUser);
router.post('/register', user_controller.registerUser);

router.get('/currency', currency_controller.currency);

router.post('/transaction', transaction_controller.getTransaksi);
router.post('/transaction', transaction_controller.addTransaksi);
router.post('/transaction', transaction_controller.updateTransaksi);
router.post('/transaction', transaction_controller.deleteTransaksi);

router.get('/category', kategori_controller.getKategori);
router.post('/category', kategori_controller.addKategori);
router.post('/category', kategori_controller.updateKategori);
router.post('/category', kategori_controller.deleteKategori);

export default router;