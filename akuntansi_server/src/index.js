import express from "express";
import cors from "cors";
import routes from "./routes/route.js";

const app = express();
const PORT = 3000;

app.use(cors());

app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));

app.use('/api', routes);

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
