const { Recruiter } = require('../models');

class RecruiterService {
  // Service method to create a new recruiter
  static async createRecruiter(recruiterData) {
    try {
      const newRecruiter = await Recruiter.create(recruiterData);
      return newRecruiter;
    } catch (error) {
      throw error; // Throw the error for the controller to handle
    }
  }

  // Service method to retrieve all recruiters
  static async getAllRecruiters() {
    try {
      const recruiters = await Recruiter.findAll();
      return recruiters;
    } catch (error) {
      throw error;
    }
  }

  // Service method to retrieve a recruiter by ID
  static async getRecruiterById(recruiterId) {
    try {
      const recruiter = await Recruiter.findByPk(recruiterId, {
        attributes: { exclude: ['password', 'createdAt', 'updatedAt'] },
      });
      if (!recruiter) {
        throw new Error('Recruiter not found');
      }
      return recruiter;
    } catch (error) {
      throw error;
    }
  }

  // Service method to update a recruiter
  static async updateRecruiter(recruiterId, recruiterData) {
    try {
      const recruiter = await Recruiter.findByPk(recruiterId, {
        attributes: { exclude: ['password', 'createdAt', 'updatedAt'] },
      });
      if (!recruiter) {
        throw new Error('Recruiter not found');
      }
      await recruiter.update(recruiterData);
      return recruiter;
    } catch (error) {
      throw error;
    }
  }

  static async deleteRecruiter(recruiterId) {
    try {
      await Recruiter.destroy({ where: { kintone_id: recruiterId } });
    } catch (error) {
      console.error('Error deleting recruiter:', error);  // Log any errors
      throw error;
    }
  }
}

module.exports = RecruiterService;
