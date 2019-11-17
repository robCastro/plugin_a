'use strict';

const express = require('express');
const pluginAController = require('../controllers/pluginAController');
const router = express.Router();

router.get('/aduana', pluginAController.get_aduanas);

module.exports = router;
