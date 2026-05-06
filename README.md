# 🎨 PosterMaker: The Code-Driven Cheatsheet Factory

![Typst](https://img.shields.io/badge/Engine-Typst-239120?style=for-the-badge&logo=rust)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)
![AI-Ready](https://img.shields.io/badge/AI--Ready-Context--Bridge-8b5cf6?style=for-the-badge)

**PosterMaker** is a high-performance, developer-centric layout engine for building professional multi-column posters and cheatsheets. It swaps legacy LaTeX/Pandoc for **Typst**, a modern Rust-based compiler that delivers instant previews and pixel-perfect vector output.

---

## 🚀 Key Features

- **💎 Vector First**: Pure vector logic for flowcharts and graphics. Crisp at any scale.
- **🏗️ Data Decoupling**: Keep your content in `JSON/YAML` and your design in `Typst`.
- **🤖 Agent-Native**: Built-in context bridges (`llms.txt`, `SKILLS.md`) for seamless AI collaboration.
- **⚡ Blazing Fast**: Millisecond compilation times with live IDE preview.
- **♿ Accessible**: Generates **Tagged PDFs** with proper semantic heading structures.

---

## 🛠️ Quick Start

### 1. Install Typst
```bash
# Windows
winget install typst

# macOS
brew install typst

# Linux (using Cargo)
cargo install --locked typst-cli
```

### 2. Run the Factory
```bash
git clone https://github.com/yourusername/posterMaker.git
cd posterMaker
typst watch main.typ
```

---

## 🗺️ The Workflow

1.  **Define Content**: Edit or create a JSON file in the `data/` directory.
2.  **Toggle Layout**: Change the data source in `main.typ`.
3.  **Refine Design**: Customize your design tokens in `template.typ`.
4.  **Auto-Ship**: Push to GitHub to trigger the CI/CD pipeline (PDF export + AI context update).

---

## 🧠 AI Bridge (For Agents)

This repository is optimized for AI assistance. Agents should refer to:
- [`llms.txt`](llms.txt): The global context map.
- [`SPEC.md`](SPEC.md): Technical constraints and vision.
- [`SKILLS.md`](SKILLS.md): Operational instructions for LLMs.

---

## 📜 License
MIT © Abuhafi
