const express = require('express')
require('dotenv').config()
const OpenAIApi = require('openai');

const app = express()

app.use(express.json())

const port = 3000

//const openai = new OpenAIApi({ apiKey: process.env.OPEN_AI_KEY });

app.get('/', (req, res) => {
 res.send('Hello World!')
})

app.listen(port, () => {
 console.log(`Server running at http://localhost:${port}`)
})

app.get('/api/questions', async (req, res) => {
    //console.log('requested questions')
    //const response = await openai.completions.create({
    //   model: "gpt-3.5-turbo",
    //   prompt: "generate  10 questions about universe and 4 answer choices for each, must be in json format with question: String and answers: [String] form.",
    //  max_tokens: 505,
    //});
    //console.log(response.data)
    res.json(questions)
})


const questions = [
    {
      "question": "What is the name of the theory that explains the rapid expansion of the universe after the Big Bang?",
      "answers": [
        "Inflation theory",
        "String theory",
        "Quantum theory",
        "Theory of relativity"
      ]
    },
    {
      "question": "What is the most abundant element in the universe?",
      "answers": [
        "Hydrogen",
        "Oxygen",
        "Carbon",
        "Helium"
      ]
    },
    {
      "question": "What is the name of the galaxy that contains our solar system?",
      "answers": [
        "Milky Way",
        "Andromeda",
        "Triangulum",
        "Sombrero"
      ]
    },
    {
      "question": "What is the name of the force that is believed to be responsible for the expansion of the universe?",
      "answers": [
        "Dark energy",
        "Gravity",
        "Electromagnetic force",
        "Strong nuclear force"
      ]
    },
    {
      "question": "What is the name of the event that marks the beginning of the universe according to the Big Bang theory?",
      "answers": [
        "The Big Bang",
        "Cosmic inflation",
        "Primordial explosion",
        "The Great Expansion"
      ]
    },
    {
      "question": "What is the term for the study of the large-scale structure and evolution of the universe?",
      "answers": [
        "Cosmology",
        "Astrophysics",
        "Astronomy",
        "Quantum mechanics"
      ]
    },
    {
      "question": "What is the name of the theoretical boundary surrounding a black hole beyond which no light or radiation can escape?",
      "answers": [
        "Event horizon",
        "Singularity",
        "Photon sphere",
        "Schwarzschild radius"
      ]
    },
    {
      "question": "What is the name of the hypothetical particle that is thought to make up dark matter?",
      "answers": [
        "Axion",
        "WIMP",
        "Graviton",
        "Neutrino"
      ]
    },
    {
      "question": "What is the term for the point in time when the universe stops expanding and begins to contract?",
      "answers": [
        "Big Crunch",
        "Big Freeze",
        "Big Bounce",
        "Big Rip"
      ]
    }
  ]
  
   
