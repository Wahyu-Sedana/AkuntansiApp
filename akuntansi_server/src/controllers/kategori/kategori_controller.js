import kategoriServices from '../../services/kategori_controller.js';

const addKategori = async (req, res) => {
    const { id_user, id_jenis, kategori } = req.body;
    try {
        const checkKategori = await kategoriServices.checkKategori(kategori);
        if (checkKategori.length > 0) {
            return res.status(400).json({
                success: true,
                message: 'Kategori sudah ada',
                data: checkKategori
            });
        } else {
            const result = await kategoriServices.addKategori({ id_user, id_jenis, kategori });
            if (result.affectedRows > 0) {
                return res.status(200).json({
                    success: true,
                    message: 'Berhasil menambahkan kategori'
                });
            }
        }
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            success: false,
            message: error.message
        });
    }
}

const getKategori = async (req, res) => {
    const { id_user, id_jenis, search } = req.body;
    try {
        const result = await kategoriServices.getKategori({ id_user, id_jenis, search });
        if (result.length > 0) {
            return res.status(200).json({
                success: true,
                message: 'Berhasil mendapatkan data',
                data: result
            });
        } else {
            return res.status(200).json({
                success: true,
                message: 'Tidak ada data',
                data: result
            });
        }
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            success: false,
            message: error.message
        });
    }
}

const updateKategori = async (req, res) => {
    const { id_user, kategori, id_jenis, id_kategori } = req.body;
    try {
        const result = await kategoriServices.updateKategori({ id_user, kategori, id_jenis, id_kategori });
        if (result.affectedRows > 0) {
            return res.status(200).json({
                success: true,
                message: 'Berhasil update kategori'
            });
        } else {
            return res.status(400).json({
                success: false,
                message: 'Gagal update kategori'
            });
        }
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            success: false,
            message: error.message
        });
    }
}

const deleteKategori = async (req, res) => {
    const { id_kategori } = req.body;
    try {
        const result = await kategoriServices.deleteKategori(id_kategori);
        if (result.affectedRows > 0) {
            return res.status(200).json({
                success: true,
                message: 'Berhasil hapus kategori'
            });
        } else {
            return res.status(400).json({
                success: false,
                message: 'Gagal hapus kategori'
            });
        }
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            success: false,
            message: error.message
        });
    }
}

export default { addKategori, getKategori, updateKategori, deleteKategori };
