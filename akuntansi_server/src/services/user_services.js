import connection from '../helper/database.js';

const login = async (user) => {
    const [result] = await connection.query('SELECT * FROM users WHERE email=? AND password=?', [user.email, user.password]);
    return result;
}

const register = async (user) => {
    const [result] = await connection.query('INSERT INTO users (username, email, password) VALUES (?,?,?)', [user.username, user.email, user.password]);
    return result;
}

export default {
    login,
    register
}