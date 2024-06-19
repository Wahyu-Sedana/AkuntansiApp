import transactionServices from '../../services/transaction_services.js';

const addTransaksi = async (req, res) => {
    const { id_kategori, jumlah, catatan, tanggal } = req.body;
    try {
        const result = await transactionServices.addTransaksi({ id_kategori, jumlah, catatan, tanggal });
        if (result.affectedRows > 0) {
            return res.status(200).json({
                success: true,
                message: 'Berhasil menambahkan transaksi',
            });
        } else {
            return res.status(400).json({
                success: false,
                message: 'Gagal menambahkan transaksi',
            });
        }
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            success: false,
            message: error.message,
        });
    }
}

const getTransaksi = async (req, res) => {
    const { id_user } = req.body;
    try {
        const result = await transactionServices.getTransaksi(id_user);
        if (result.length > 0) {
            return res.status(200).json({
                success: true,
                message: 'Berhasil mendapatkan data',
                data: result,
            });
        } else {
            return res.status(200).json({
                success: true,
                message: 'Belum ada data',
                data: result,
            });
        }
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            success: false,
            message: error.message,
        });
    }
}

const updateTransaksi = async (req, res) => {
    const { id_transaksi, id_kategori, jumlah, tanggal, catatan } = req.body;
    try {
        const result = await transactionServices.updateTransaksi({ id_transaksi, id_kategori, jumlah, tanggal, catatan });
        if (result.affectedRows > 0) {
            return res.status(200).json({
                success: true,
                message: 'Berhasil update transaksi',
            });
        } else {
            return res.status(400).json({
                success: false,
                message: 'Gagal update transaksi',
            });
        }
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            success: false,
            message: error.message,
        });
    }
}

const deleteTransaksi = async (req, res) => {
    const { id_transaksi } = req.body;
    try {
        const result = await transactionServices.deleteTransaksi(id_transaksi);
        if (result.affectedRows > 0) {
            return res.status(200).json({
                success: true,
                message: 'Berhasil delete transaksi',
            });
        } else {
            return res.status(400).json({
                success: false,
                message: 'Gagal delete transaksi',
            });
        }
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            success: false,
            message: error.message,
        });
    }
}

export default { addTransaksi, getTransaksi, updateTransaksi, deleteTransaksi };
