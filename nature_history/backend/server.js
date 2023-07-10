const express = require("express");
const mysql = require("mysql");
const bodyParser = require("body-parser"); // Import body-parser
const app = express();
const cors = require("cors");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const crypto = require("crypto");
const secretKey = crypto.randomBytes(32).toString("hex");
const port = 8080;

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Konfigurasi koneksi MySQL
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "natural_history", // Ganti dengan nama database Anda
});

// Membuat koneksi ke MySQL
connection.connect((err) => {
  if (err) {
    console.log("Database connection error: ", err);
  } else {
    console.log("Connected to database");
  }
});

app.post("/api/signup", (req, res) => {
  const { name, email, password } = req.body;

  // Melakukan hash password sebelum menyimpan ke database
  bcrypt
    .hash(password, 6)
    .then((hashedPassword) => {
      // Melakukan query ke database untuk menyimpan data
      const sql = `INSERT INTO users (name, email, password) VALUES ('${name}', '${email}', '${hashedPassword}')`;
      connection.query(sql, (error, results) => {
        if (error) {
          console.log("Error during signup: ", error);
          res.status(500).json({ message: "Internal Server Error" });
        } else {
          const token = jwt.sign({ email: email }, secretKey); // Ganti "secret_key" dengan kunci rahasia yang lebih kuat
          jwt.verify(token, secretKey, (error, decoded) => {
            res.status(200).json({
              message: "Signup successful",
              name: name,
              token: token,
            });
          });
        }
      });
    })
    .catch((err) => {
      console.log("Error during password hashing: ", err);
      res.status(500).json({ message: "Internal Server Error" });
    });
});

app.post("/api/signin", (req, res) => {
  const email = req.body.email;
  const password = req.body.password;

  // Lakukan pemeriksaan validitas email di database
  connection.query(
    "SELECT * FROM users WHERE email = ?",
    [email],
    (error, results) => {
      if (error) {
        res.status(500).json({ message: "Internal Server Error" });
      } else if (results.length === 0) {
        res.status(401).json({ message: "Invalid email or password" });
      } else {
        const user = results[0];
        // Periksa kecocokan password menggunakan bcrypt
        bcrypt
          .compare(password, user.password)
          .then((result) => {
            if (result) {
              const name = user.name;
              const token = jwt.sign({ email: email }, secretKey); // Ganti "secret_key" dengan kunci rahasia yang lebih kuat
              jwt.verify(token, secretKey, (error, decoded) => {
                res.status(200).json({
                  message: "Login successful",
                  name: name,
                  token: token,
                });
              });
            } else {
              res.status(401).json({ message: "Invalid email or password" });
            }
          })
          .catch((error) => {
            res.status(500).json({ message: "Internal Server Error" });
          });
      }
    }
  );
});

app.get("/api/name", (req, res) => {
  const token = req.headers.authorization?.split(" ")[1];

  jwt.verify(token, secretKey, (error, decoded) => {
    if (error) {
      res.status(401).json({ message: "Invalid token" });
    } else {
      const email = decoded.email;

      // Query the database to retrieve the user's name based on the email
      const sql = "SELECT name FROM users WHERE email = ? LIMIT 1";
      connection.query(sql, [email], (err, result) => {
        if (err) {
          res.status(500).json({ message: "Internal Server Error" });
        } else {
          if (result.length > 0) {
            const name = result[0].name;
            res.status(200).json({ name: name });
          } else {
            res.status(404).json({ message: "Name not found" });
          }
        }
      });
    }
  });
});

app.get("/api/flowers", (req, res) => {
  connection.query("SELECT * FROM flowers", (err, result) => {
    if (err) {
      res.status(500).json({ message: "Internal Server Error" });
    } else {
      res.status(200).json(result);
    }
  });
});

// FIX
app.get("/api/details", (req, res) => {
  connection.query(
    "SELECT `name`, `description`, `scientific`, `genus`, `family`, `kingdom`, `order`, `tribe`, `image` FROM detail_flowers LIMIT 1;",
    (err, result) => {
      if (err) {
        res.status(500).json({ message: "Internal Server Error" });
      } else {
        res.status(200).json(result);
      }
    }
  );
});

// app.get("/api/details", (req, res) => {
//   const flowerId = req.query.id || 1; // Ganti 1 dengan id bunga yang sesuai dengan database Anda
//   connection.query(
//     "SELECT `id`, `name`, `description`, `scientific`, `genus`, `family`, `kingdom`, `order`, `tribe`, `image` FROM detail_flowers WHERE `id` = ? LIMIT 1;",
//     [flowerId],
//     (err, result) => {
//       if (err) {
//         res.status(500).json({ message: "Internal Server Error" });
//       } else {
//         res.status(200).json(result);
//       }
//     }
//   );
// });
// app.get("/api/details", (req, res) => {
//   const flowerIndex = req.query.index || 0;
//   connection.query(
//     "SELECT `id`, `name`, `description`, `scientific`, `genus`, `family`, `kingdom`, `order`, `tribe`, `image` FROM detail_flowers LIMIT ?, 1;",
//     [flowerIndex],
//     (err, result) => {
//       if (err) {
//         res.status(500).json({ message: "Internal Server Error" });
//       } else {
//         res.status(200).json(result);
//       }
//     }
//   );
// });



app.post("/api/addflowers", (req, res) => {
  const { imagePath, title } = req.body; // Tambahkan ini untuk mendapatkan imagePath dan title dari req.body

  const sql = `INSERT INTO addflowers(imagePath, title) VALUES ('${imagePath}', '${title}')`;
  connection.query(sql, (err, result) => {
    if (err) {
      res.status(500).json({ message: "Internal Server Error" });
    } else {
      res.status(200).json(result);
      console.log("data berhasil ditambahkan");
    }
  });
});

// Menjalankan server
app.listen(port, () => {
  console.log(`Server berjalan di http://localhost:${port}`);
});

// app.get("/api/name", (req, res) => {
//   // Melakukan query ke database untuk mendapatkan fullname
//   const sql = "SELECT name FROM users LIMIT 1"; // Menggunakan LIMIT 1 untuk hanya mengambil satu baris data
//   connection.query(sql, (err, result) => {
//     if (err) {
//       res.status(500).json({ message: "Internal Server Error" });
//     } else {
//       if (result.length > 0) {
//         const name = result[0].name;
//         res.status(200).json({ name: name }); // Mengirim response berisi data nama
//       } else {
//         res.status(404).json({ message: "Name not found" });
//       }
//     }
//   });
// });
