import cors from 'cors';
import dotenv from 'dotenv';
import express from 'express';
import petRoutes from './routes/petRoutes';

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json());

app.use('/api/pets', petRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
