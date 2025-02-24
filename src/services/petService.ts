import { Pets, Prisma } from '@prisma/client';
import prisma from '../config/db';

const getAllPets = async (): Promise<Pets[]> => {
  return await prisma.pets.findMany();
};

const getPetById = async (petId: string): Promise<Pets | null> => {
  return await prisma.pets.findUnique({
    where: { petId }
  });
};

const createPet = async (data: Prisma.PetsCreateInput): Promise<Pets> => {
  return await prisma.pets.create({ data });
};

const deletePetById = async (petId: string): Promise<Pets | null> => {
  return await prisma.pets.delete({ where: { petId } });
};

export default { getAllPets, getPetById, createPet, deletePetById };
