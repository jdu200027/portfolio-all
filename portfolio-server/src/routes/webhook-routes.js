const express = require('express');
const router = express.Router();
const staffController = require('../controllers/staffController');
const recruiterController = require('../controllers/recruiterController');

router.post('/staff', staffController.webhookHandler);
router.post('/recruiter', recruiterController.webhookHandler);

module.exports = router;
