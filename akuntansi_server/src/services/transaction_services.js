import connection from '../helper/database.js';

const addTransaksi = async (transaksi) => {
    const query = `INSERT INTO transaksi_ (_id_kategori, _jumlah, _catatan, _tanggal)
                   VALUES(:id_kategori, :jumlah, :catatan, :tanggal)`;
    const [result] = await connection.query(query, transaksi);
    return result;
}

const getTransaksi = async (userId) => {
    const query = `SELECT k._id_jenis as id_jenis, k._kategori as kategori, 
                          t._id_transaksi as id_transaksi, t._jumlah as jumlah, t._catatan as catatan, 
                          DATE_FORMAT(t._tanggal, '%d-%m-%Y') as tanggal, DATE_FORMAT(t._waktu_insert, 
                          '%d-%m-%Y %H:%I:%s') as waktu_input 
                   FROM transaksi_ t INNER JOIN kategori_ k ON t._id_kategori=k._id_kategori 
                   WHERE k._id_user= :id_user`;
    const [result] = await connection.query(query, { id_user: userId });
    return result;
}

const updateTransaksi = async (transaksi) => {
    const query = `UPDATE transaksi_ SET _id_kategori= :id_kategori, _jumlah= :jumlah, _tanggal= :tanggal,
                   _catatan= :catatan WHERE _id_transaksi= :id_transaksi`;
    const [result] = await connection.query(query, transaksi);
    return result;
}

const deleteTransaksi = async (transaksiId) => {
    const query = `DELETE FROM transaksi_ WHERE _id_transaksi= :id_transaksi`;
    const [result] = await connection.query(query, { id_transaksi: transaksiId });
    return result;
}

export default {
    addTransaksi,
    getTransaksi,
    updateTransaksi,
    deleteTransaksi
}
