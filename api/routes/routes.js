'use strict';

const express = require('express');
const pluginAController = require('../controllers/pluginAController');
const pasaController = require('../controllers/pasaController');
const router = express.Router();

router.get('/aduana', pluginAController.get_aduanas);
router.get('/pasa/:id_mercancia/detalle', pasaController.get_pasa_detalle);
module.exports = router;
