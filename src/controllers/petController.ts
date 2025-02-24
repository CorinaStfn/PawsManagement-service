import { Request, Response } from 'express';
import petService from '../services/petService';

export const getAllPets = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const pets = await petService.getAllPets();
    res.json(pets);
  } catch (error) {
    res.status(500).json({ error: 'Something went wrong' });
  }
};

export const getPetById = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const petId = req.params.id;
    const pet = await petService.getPetById(petId);
    if (!pet) {
      res.status(404).json({ message: 'Pet not found' });
      return;
    }
    res.json(pet);
  } catch (error) {
    res.status(500).json({ error: 'Something went wrong' });
  }
};

export const createPet = async (req: Request, res: Response): Promise<void> => {
  try {
    const newPet = await petService.createPet(req.body);
    res.status(201).json(newPet);
  } catch (error) {
    res.status(500).json({ error: 'Failed to create pet' });
  }
};

export const deletePet = async (req: Request, res: Response): Promise<void> => {
  try {
    const petId = req.params.id;
    const deletedPet = await petService.deletePetById(petId);
    if (!deletedPet) {
      res.status(404).json({ message: 'Pet not found' });
      return;
    }
    res.status(200).json({ message: 'Pet deleted successfully' });
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete pet' });
  }
};
