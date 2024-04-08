import user_controller from '../controllers/user_controller.js';

describe('User Services', () => {
  const req = {
    body: {
      email: 'test@example.com',
      password: 'password123',
      username: 'testuser'
    }
  };
  const res = {
    status: jest.fn().mockReturnThis(),
    json: jest.fn()
  };

  describe('Register User', () => {
    it('should return "Registration successful" if registration is successful', async () => {
      await user_controller.registerUser(req, res);
      expect(res.status).toHaveBeenCalledWith(200);
      expect(res.json).toHaveBeenCalledWith({ message: 'Registration successful' });
    });
  });


  describe('Login User', () => {
    it('should return "Login successful" if login credentials are correct', async () => {
      await user_controller.loginUser(req, res);
      expect(res.status).toHaveBeenCalledWith(200);
      expect(res.json).toHaveBeenCalledWith({ message: 'Login successful' });
    });
  });
});
