-- CreateTable
CREATE TABLE "Pets" (
    "petId" UUID NOT NULL,
    "knownDateOfBirth" TIMESTAMP(3),
    "estimateDateOfBirth" TIMESTAMP(3),
    "arrivalDate" TIMESTAMP(3),
    "species" TEXT NOT NULL,
    "status" TEXT NOT NULL,

    CONSTRAINT "Pets_pkey" PRIMARY KEY ("petId")
);

-- CreateTable
CREATE TABLE "Breed" (
    "breedId" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "behavior" TEXT,
    "lifeSpan" INTEGER,
    "origin" TEXT,
    "size" TEXT,
    "coat" TEXT,
    "exerciseNeeds" TEXT,
    "training" TEXT,
    "grooming" TEXT,
    "health" TEXT,

    CONSTRAINT "Breed_pkey" PRIMARY KEY ("breedId")
);

-- CreateTable
CREATE TABLE "PetBreed" (
    "petBreedId" UUID NOT NULL,
    "petId" UUID NOT NULL,
    "breedId" UUID NOT NULL,

    CONSTRAINT "PetBreed_pkey" PRIMARY KEY ("petBreedId")
);

-- CreateTable
CREATE TABLE "HealthCondition" (
    "healthConditionId" UUID NOT NULL,
    "scientificName" TEXT NOT NULL,
    "commonName" TEXT NOT NULL,
    "description" TEXT,
    "symptoms" TEXT,
    "species" TEXT,
    "causes" TEXT,
    "prevention" TEXT,
    "severityLevel" TEXT,

    CONSTRAINT "HealthCondition_pkey" PRIMARY KEY ("healthConditionId")
);

-- CreateTable
CREATE TABLE "HealthConditionBreedProne" (
    "healthConditionBreedProneId" UUID NOT NULL,
    "breedId" UUID NOT NULL,
    "healthConditionId" UUID NOT NULL,

    CONSTRAINT "HealthConditionBreedProne_pkey" PRIMARY KEY ("healthConditionBreedProneId")
);

-- CreateTable
CREATE TABLE "PetHealthCondition" (
    "petHealthConditionId" UUID NOT NULL,
    "petId" UUID NOT NULL,
    "healthConditionId" UUID NOT NULL,
    "notes" TEXT,

    CONSTRAINT "PetHealthCondition_pkey" PRIMARY KEY ("petHealthConditionId")
);

-- CreateTable
CREATE TABLE "Foster" (
    "fosterId" UUID NOT NULL,
    "petId" UUID NOT NULL,
    "personId" UUID NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3),
    "notes" TEXT,

    CONSTRAINT "Foster_pkey" PRIMARY KEY ("fosterId")
);

-- CreateTable
CREATE TABLE "AdopterFosterer" (
    "personId" UUID NOT NULL,
    "firstName" TEXT NOT NULL,
    "middleName" TEXT,
    "lastName" TEXT NOT NULL,
    "phoneNumber" TEXT,
    "emailAddress" TEXT,
    "address" TEXT,

    CONSTRAINT "AdopterFosterer_pkey" PRIMARY KEY ("personId")
);

-- CreateTable
CREATE TABLE "Adoption" (
    "adoptionId" UUID NOT NULL,
    "petId" UUID NOT NULL,
    "personId" UUID NOT NULL,
    "adoptionDate" TIMESTAMP(3) NOT NULL,
    "notes" TEXT,

    CONSTRAINT "Adoption_pkey" PRIMARY KEY ("adoptionId")
);

-- CreateTable
CREATE TABLE "Treatment" (
    "treatmentId" UUID NOT NULL,
    "drugName" TEXT NOT NULL,
    "description" TEXT,
    "species" TEXT,
    "possibleSideEffects" TEXT,
    "costRange" TEXT,
    "averageDuration" TEXT,
    "methodOfAdministration" TEXT,

    CONSTRAINT "Treatment_pkey" PRIMARY KEY ("treatmentId")
);

-- CreateTable
CREATE TABLE "PetTreatment" (
    "petTreatmentId" UUID NOT NULL,
    "petId" UUID NOT NULL,
    "doctorId" UUID NOT NULL,
    "treatmentId" UUID NOT NULL,
    "notes" TEXT,

    CONSTRAINT "PetTreatment_pkey" PRIMARY KEY ("petTreatmentId")
);

-- CreateTable
CREATE TABLE "Doctors" (
    "doctorId" UUID NOT NULL,
    "firstName" TEXT NOT NULL,
    "middleName" TEXT,
    "lastName" TEXT NOT NULL,
    "phoneNumber" TEXT,
    "email" TEXT,
    "address" TEXT,

    CONSTRAINT "Doctors_pkey" PRIMARY KEY ("doctorId")
);

-- CreateTable
CREATE TABLE "Procedures" (
    "procedureId" UUID NOT NULL,
    "scientificName" TEXT NOT NULL,
    "commonName" TEXT NOT NULL,
    "description" TEXT,
    "costRange" TEXT,
    "rateOfSuccess" TEXT,

    CONSTRAINT "Procedures_pkey" PRIMARY KEY ("procedureId")
);

-- CreateTable
CREATE TABLE "Intervention" (
    "interventionId" UUID NOT NULL,
    "petId" UUID NOT NULL,
    "doctorId" UUID NOT NULL,
    "procedureId" UUID NOT NULL,
    "startOfProcedure" TIMESTAMP(3) NOT NULL,
    "endOfProcedure" TIMESTAMP(3),
    "doctorNotes" TEXT,
    "wasSuccessful" BOOLEAN NOT NULL,

    CONSTRAINT "Intervention_pkey" PRIMARY KEY ("interventionId")
);

-- AddForeignKey
ALTER TABLE "PetBreed" ADD CONSTRAINT "PetBreed_petId_fkey" FOREIGN KEY ("petId") REFERENCES "Pets"("petId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PetBreed" ADD CONSTRAINT "PetBreed_breedId_fkey" FOREIGN KEY ("breedId") REFERENCES "Breed"("breedId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HealthConditionBreedProne" ADD CONSTRAINT "HealthConditionBreedProne_breedId_fkey" FOREIGN KEY ("breedId") REFERENCES "Breed"("breedId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HealthConditionBreedProne" ADD CONSTRAINT "HealthConditionBreedProne_healthConditionId_fkey" FOREIGN KEY ("healthConditionId") REFERENCES "HealthCondition"("healthConditionId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PetHealthCondition" ADD CONSTRAINT "PetHealthCondition_petId_fkey" FOREIGN KEY ("petId") REFERENCES "Pets"("petId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PetHealthCondition" ADD CONSTRAINT "PetHealthCondition_healthConditionId_fkey" FOREIGN KEY ("healthConditionId") REFERENCES "HealthCondition"("healthConditionId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Foster" ADD CONSTRAINT "Foster_petId_fkey" FOREIGN KEY ("petId") REFERENCES "Pets"("petId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Foster" ADD CONSTRAINT "Foster_personId_fkey" FOREIGN KEY ("personId") REFERENCES "AdopterFosterer"("personId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Adoption" ADD CONSTRAINT "Adoption_petId_fkey" FOREIGN KEY ("petId") REFERENCES "Pets"("petId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Adoption" ADD CONSTRAINT "Adoption_personId_fkey" FOREIGN KEY ("personId") REFERENCES "AdopterFosterer"("personId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PetTreatment" ADD CONSTRAINT "PetTreatment_petId_fkey" FOREIGN KEY ("petId") REFERENCES "Pets"("petId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PetTreatment" ADD CONSTRAINT "PetTreatment_doctorId_fkey" FOREIGN KEY ("doctorId") REFERENCES "Doctors"("doctorId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PetTreatment" ADD CONSTRAINT "PetTreatment_treatmentId_fkey" FOREIGN KEY ("treatmentId") REFERENCES "Treatment"("treatmentId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Intervention" ADD CONSTRAINT "Intervention_petId_fkey" FOREIGN KEY ("petId") REFERENCES "Pets"("petId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Intervention" ADD CONSTRAINT "Intervention_doctorId_fkey" FOREIGN KEY ("doctorId") REFERENCES "Doctors"("doctorId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Intervention" ADD CONSTRAINT "Intervention_procedureId_fkey" FOREIGN KEY ("procedureId") REFERENCES "Procedures"("procedureId") ON DELETE RESTRICT ON UPDATE CASCADE;
