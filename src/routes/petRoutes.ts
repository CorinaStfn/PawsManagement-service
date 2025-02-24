import express from 'express';
import {
  getAllPets,
  getPetById,
  createPet,
  deletePet
} from '../controllers/petController';

const router = express.Router();

router.get('/', getAllPets);
router.get('/:id', getPetById);
router.post('/', createPet);
router.delete('/:id', deletePet);

export default router;
