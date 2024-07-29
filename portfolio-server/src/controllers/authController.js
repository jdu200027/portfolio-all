const AuthService = require('../services/authService');

class AuthController {
  static async login(req, res) {
    const { email, password } = req.body;
    try {
      
      const { userType } = await AuthService.login(email, password, res);
      console.log(req.body);
      res.json({ userType });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  }

  static async logout(req, res) {
    try {
      await AuthService.logout(res);
      res.json({ message: 'Logged out successfully' });
    } catch (error) {
      res.status(500).json({ error: 'Failed to logout' });
    }
  }
}

module.exports = AuthController;
