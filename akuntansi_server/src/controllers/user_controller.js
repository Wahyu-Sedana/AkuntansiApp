import user_services from '../services/user_services.js';
import crypto from 'crypto';

const loginUser = async (req, res) => {
    const {email, password} = req.body;
    const hashPassword = crypto.createHash('md5').update(password).digest('hex');
    try {
        const result = await user_services.login({email, password: hashPassword});
        console.log(result);
        if (result.length > 0) {
            res.status(200).json({
                message: 'Login successful'
            });
        } else {
            res.status(401).json({
                message: 'Login failed'
            });
        }
    } catch (error) {
        res.status(500).json({
            message: error.message
        });
    }
}

const registerUser = async (req, res) => {
    const {username, email, password} = req.body;
    const hashPassword = crypto.createHash('md5').update(password).digest('hex');
    try {
        const result = await user_services.register({username, email, password: hashPassword});
        console.log('masuk ga kesini', result);
        if (result.affectedRows > 0) {
            res.status(200).json({
                message: 'Registration successful'
            });
        } else {
            res.status(401).json({
                message: 'Registration failed'
            });
        }
    } catch (error) {
        res.status(500).json({
            message: error.message
        });
    }
}

export default {
    loginUser,
    registerUser
}