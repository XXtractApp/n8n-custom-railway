# Custom n8n for Railway with Python Support

This is a custom n8n Docker image with Python and Tabula support for unlimited PDF table extraction.

## Features
- n8n workflow automation
- Python 3 support
- Tabula-py for PDF table extraction
- Pandas for data manipulation
- Java runtime for Tabula

## Environment Variables Required
- N8N_ENCRYPTION_KEY
- N8N_HOST=0.0.0.0
- N8N_PORT=5678
- WEBHOOK_URL

## Deployment
Deploy to Railway by connecting this GitHub repository.
```

3. **File → Save As** → Name it: `README.md`
4. Save it in your `n8n-custom-railway` folder

---

## ✅ Your Folder Should Now Have 3 Files:
```
n8n-custom-railway/
├── Dockerfile       ← Step 3
├── .dockerignore    ← Step 4
└── README.md        ← Step 5
