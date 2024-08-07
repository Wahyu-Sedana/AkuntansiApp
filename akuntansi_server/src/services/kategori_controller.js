import connection from '../helper/database.js';

const addKategori = async (kategori) => {
    const queryAddKategori = `INSERT INTO kategori_ (_id_user, _id_jenis, _status, _kategori) 
                              VALUES(?, ?, 1, ?)`;
    return await connection.query(queryAddKategori, [kategori]);
}

const checkKategori = async (kategori) => {
    const queryCheckKategori = `SELECT _id_user AS id_user, _kategori AS kategori, _id_jenis AS id_jenis 
                                FROM kategori_ WHERE _kategori= ?`;
    const [result] = await connection.query(queryCheckKategori, [ kategori ]);
    return result;
}

const getKategori = async ({ id_user, id_jenis, search }) => {
    let condt = '';

    if (search) {
        condt += ` AND _kategori LIKE '%${search}%'`;
    }

    if (id_jenis) {
        condt += ` AND _id_jenis= '${id_jenis}'`;
    }

    const queryGetKategori = `SELECT _id_kategori AS id_kategori, _id_jenis AS id_jenis, _kategori AS kategori 
                              FROM kategori_ WHERE _status=1 AND _id_user= ? ${condt}`;
    const [result] = await connection.query(queryGetKategori, [ id_user ]);
    return result;
}

const updateKategori = async ({ kategori }) => {
    const queryUpdateKategori = `UPDATE kategori_ SET _id_jenis= :id_jenis, _kategori= ? 
                                 WHERE _id_kategori= ?`;
    return await connection.query(queryUpdateKategori, [kategori]);
}

const deleteKategori = async (id_kategori) => {
    const queryDeleteKategori = `DELETE FROM kategori_ WHERE _id_kategori= ?`;
    return await connection.query(queryDeleteKategori, [id_kategori]);
}

export default {
    addKategori,
    checkKategori,
    getKategori,
    updateKategori,
    deleteKategori
}
