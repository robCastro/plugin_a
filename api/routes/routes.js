'use strict';

const express = require('express');
const pluginAController = require('../controllers/pluginAController');
const pasaController = require('../controllers/pasaController');
const ivaController = require('../controllers/ivaController');
const aduanaController = require('../controllers/aduanaController');
const arancelController = require('../controllers/arancelController');
const router = express.Router();


router.get('/aduana', pluginAController.get_aduanas);

router.get('/pasa/:id_mercancia/detalle', pasaController.get_pasa_detalle);
router.post('/pasa', pasaController.post_pasa);

router.get('/iva', ivaController.get_iva);


router.get('/aduana/:id_aduana', aduanaController.get_aduana);


router.get('/arancel/:id_tipo_mercancia', arancelController.get_arancel);


module.exports = router;
