const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { Pool } = require('pg');

const app = express();

// Middleware de base
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// CORS simple
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
    next();
});

// Configuration PostgreSQL
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'utilisateur',
    password: '123',
    port: 5432,
});

// Test de connexion
pool.connect((err, client, release) => {
    if (err) {
        console.error('❌ Erreur PostgreSQL:', err.message);
    } else {
        console.log('✅ Connecté à PostgreSQL');
        release();
    }
});

// Route de test
app.get('/api/test', (req, res) => {
    console.log('✅ Test route appelée');
    res.json({ 
        success: true,
        message: 'API BTP Optim fonctionne!',
        timestamp: new Date().toISOString()
    });
});

// Debug users
app.get('/api/debug/users', async (req, res) => {
    try {
        const result = await pool.query('SELECT id, email, role FROM utilisateurs');
        res.json({
            success: true,
            users: result.rows
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: error.message
        });
    }
});

// Route de login
app.post('/api/auth/login', async (req, res) => {
    console.log('🔐 Login attempt - Body:', req.body);
    
    const { email, password } = req.body;
    
    if (!email || !password) {
        return res.status(400).json({
            success: false,
            message: 'Email et mot de passe requis'
        });
    }

    try {
        const userResult = await pool.query(
            'SELECT id, email, mot_de_passe, nom, prenom, role FROM utilisateurs WHERE email = $1',
            [email]
        );
        
        if (userResult.rows.length === 0) {
            return res.status(401).json({
                success: false,
                message: 'Email ou mot de passe incorrect'
            });
        }

        const user = userResult.rows[0];
        const isPasswordValid = await bcrypt.compare(password, user.mot_de_passe);
        
        if (!isPasswordValid) {
            return res.status(401).json({
                success: false,
                message: 'Email ou mot de passe incorrect'
            });
        }

        const token = jwt.sign(
            { userId: user.id, email: user.email, role: user.role },
            'btp_optim_secret_key',
            { expiresIn: '24h' }
        );

        const { mot_de_passe, ...userWithoutPassword } = user;
        
        console.log('✅ Login successful for:', email);
        
        res.json({
            success: true,
            message: 'Connexion réussie',
            token,
            user: userWithoutPassword
        });

    } catch (error) {
        console.error('💥 Login error:', error);
        res.status(500).json({
            success: false,
            message: 'Erreur serveur'
        });
    }
});

// Démarrer le serveur
const PORT = 3000;
app.listen(PORT, '0.0.0.0', () => {
    console.log('\n🚀 Serveur BTP Optim démarré!');
    console.log('📍 URLs:');
    console.log('   http://localhost:3000/api/test');
    console.log('   http://192.168.1.12:3000/api/test');
    console.log('\n👤 Test login:');
    console.log('   curl -X POST http://192.168.1.12:3000/api/auth/login \\');
    console.log('     -H "Content-Type: application/json" \\');
    console.log('     -d \'{"email":"sarah@btpoptim.ma","password":"password"}\'');
});