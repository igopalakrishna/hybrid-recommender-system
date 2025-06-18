# Hybrid Anime Recommender System 

![Build](https://img.shields.io/github/actions/workflow/status/igopalakrishna/hybrid-recommender-system/deploy.yml?branch=main)
![Docker](https://img.shields.io/badge/docker-ready-blue)
![Kubernetes](https://img.shields.io/badge/Kubernetes-deployed-blue)
![DVC](https://img.shields.io/badge/Data%20Versioning-DVC-success)
![CometML](https://img.shields.io/badge/Experiment%20Tracking-CometML-yellow)
![License](https://img.shields.io/github/license/igopalakrishna/hybrid-recommender-system)
![Python](https://img.shields.io/badge/Python-3.8%2B-blue.svg)

An end-to-end production-grade **Hybrid Anime Recommender System** that combines **Collaborative Filtering** and **Content-Based Filtering**, built using **TensorFlow**, tracked with **CometML**, and deployed using **GitHub Actions + Docker + Kubernetes (GKE)**. The system is modular, version-controlled (Git + DVC), and features a live **Flask web UI** for anime recommendations.

---

## Project Highlights

| Component       | Tech Stack                                             |
| --------------- | ------------------------------------------------------ |
| **Framework**   | TensorFlow, Flask, Scikit-learn                        |
| **MLOps Tools** | CometML, DVC, GitHub Actions, GCP, Kubernetes          |
| **Deployment**  | Docker, Google Kubernetes Engine (GKE)                 |
| **Tracking**    | CometML (experiments) + Git (code) + DVC (data/models) |
| **Dataset**     | MyAnimeList 2020 Dataset (70M+ records)                |
| **Frontend**    | Responsive web UI with neon anime theme                |

---

## Recommendation Techniques

* **Content-Based Filtering**: TF-IDF + Cosine Similarity on metadata and synopsis
* **Collaborative Filtering**: Matrix Factorization using embeddings (User x Anime)
* **Hybrid Model**: Combines both approaches with weighted scoring

---

## Model Performance

| Metric   | Final Train | Final Test |
| -------- | ----------- | ---------- |
| **Loss** | 0.4268      | 0.4963     |
| **MAE**  | 0.1515      | 0.1863     |
| **MSE**  | 0.0491      | 0.0727     |

> Achieved convergence by Epoch 16 with custom learning rate scheduling

### Training Curves

![Training Curves](.img/training_metrics.png)

---

## Live Web Application

| Feature   | Description                                          |
| --------- | ---------------------------------------------------- |
| Input  | Accepts a user ID                                    |
| Output | Displays top recommended anime with genre & synopsis |
| Style  | Dark-themed neon interface for anime fans            |

![UI Preview](.img/ui_preview.png)

---

## End-to-End Pipeline

1. **Data Ingestion**

   * Pulled from **GCP Buckets**
   * Selectively ingested 5M records from 70M

2. **Modular Preprocessing**

   * Filtering active users
   * Min-max scaling ratings
   * Encoding user/anime IDs

3. **Model Building**

   * TensorFlow Embedding Model
   * Learned User & Anime latent features

4. **Training Pipeline**

   * Integrated with **CometML**
   * ModelCheckpoint, LR Scheduler, EarlyStopping

5. **Inference Pipeline**

   * Modular helper functions in `utils/helpers.py`
   * Content-based + user-based recommendation logic

6. **UI + Flask API**

   * Simple web interface for real-time recommendations

7. **Artifact Management**

   * GitHub: code
   * DVC + GCS: data, weights, checkpoints

8. **CI/CD + Cloud Deployment**

   * GitHub Actions: build & deploy Docker image
   * Kubernetes (GKE): load-balanced cluster with autoscaling pods

---

## 🛌 Deployment Dashboard (GKE)

### Kubernetes Cluster

* **Cluster**: `ml-app-cluster`
* **App**: `ml-app` (2/2 pods running)
* **Auto-scaling**: Horizontal scalability enabled
* **Monitoring**: Live CPU, memory, and storage charts

![GKE Cluster](./gke_cluster.png)

---

## Why This Project Stands Out

| Strength                   | Description                                         |
| -------------------------- | --------------------------------------------------- |
| Full MLOps Lifecycle    | Ingestion ➔ Training ➔ Versioning ➔ Deployment ➔ UI |
| Scalable Infrastructure | Runs on Google Kubernetes Engine (GKE)              |
| Data Integrity          | Ensured via DVC + GCS versioning                    |
| Live Predictions        | Delivered through containerized Flask app           |
| Experiment Tracking     | All runs tracked with CometML dashboard             |
| Real-World Dataset      | Based on 70M user interactions from MyAnimeList     |

---

## Project Structure

```bash
├── .dvc/                  # DVC metadata
├── artifacts/             # Raw, processed data, models, weights
├── config/                # YAML + path config
├── notebook/              # Jupyter prototyping
├── pipeline/              # Training & prediction pipelines
├── src/                   # Base model, training, ingestion
├── utils/                 # Helper functions
├── static/, templates/    # Flask UI assets
├── Dockerfile             # Container definition
├── app.py                 # Flask application
├── requirements.txt       # Dependencies
├── deployment.yaml        # Kubernetes deployment
```


---

## For Recruiters & Engineers

This project demonstrates:

* Real-world recommender systems at scale
* Mastery of end-to-end MLOps practices
* CI/CD DevOps deployment on cloud infra
* Strong fundamentals in ML engineering and pipeline design
* Hands-on experience with tools like Kubernetes, CometML, DVC, and GCP

---

## Future Enhancements

* Integrate vector database for fast similarity search
* Add user login/auth + session memory
* Extend to multilingual anime titles
* Integrate Hugging Face transformers for plot embeddings

---

Made with ❤️ by [@igopalakrishna](https://github.com/igopalakrishna)
