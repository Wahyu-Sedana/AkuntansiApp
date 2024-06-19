import user_services from '../services/user_services.js';
import crypto from 'crypto';

const loginUser = async (req, res) => {
    const {email, password} = req.body;
    const hashPassword = crypto.createHash('md5').update(password).digest('hex');
    try {
        const result = await user_services.login({email, password: hashPassword});
        console.log(result);
        if (result.length > 0) {
            return res.status(200).json({
                status: 200,
                message: 'Login successful',
                success: true,
                data: result
            });
        } else {
            return res.status(404).json({
                status: 404,
                message: 'Email belum terdaftar',
                success: false
            });
        }
    } catch (error) {
        return res.status(500).json({
            status: 500,
            message: error.message,
            success: false
        });
    }
}

const registerUser = async (req, res) => {
    const {namaUsaha, alamat, email, password} = req.body;
    const hashPassword = crypto.createHash('md5').update(password).digest('hex');
    try {
        const checkEmail = await user_services.checkEmail({email});
        if (checkEmail.length >= 1) {
            console.log('masuk pengecekan');
            return res.status(409).json({
                status: 409,
                message: 'Email already exists',
                success: true,
            });
        } else {
            const result = await user_services.register({namaUsaha, alamat, email, password: hashPassword});
            console.log('masuk ga kesini', result);
            if (result.affectedRows > 0) {
                return res.status(200).json({
                    status: 200,
                    message: 'Registration successful',
                    success: true
                });
            } else {
                return res.status(401).json({
                    status: 401,
                    message: 'Registration failed',
                    success: false
                });
            }
        }
    } catch (error) {
        return res.status(500).json({
            status:5200,
            message: error.message,
            success: false
        });
    }
}


export default {
    loginUser,
    registerUser
}