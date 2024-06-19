import connection from '../helper/database.js';

const login = async (user) => {
    const [result] = await connection.query('SELECT * FROM user_ WHERE _email=? AND _password=?', [user.email, user.password]);
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