import connection from '../helper/database.js';

const login = async (user) => {
    const [result] = await connection.query('SELECT _id_user AS id_user, _nama_usaha AS nama_usaha, _alamat AS alamat, _email AS email, _password AS password, _tgl_register AS tgl_register FROM user_ WHERE _email=? AND _password=?', [user.email, user.password]);
    return result;
}

const register = async (user) => {
    const [result] = await connection.query('INSERT INTO user_ (_nama_usaha, _alamat, _email, _password) VALUES (?,?,?,?)', [user.namaUsaha, user.alamat, user.email, user.password]);
    return result;
}

const checkEmail = async (user) => {
    const [result] = await connection.query('SELECT * FROM user_ WHERE _email=?', [user.email]);
    return result;
}

export default {
    login,
    register,
    checkEmail
}