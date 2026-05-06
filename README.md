# 🎨 Mindmap Cheatsheet (PosterMaker)

![Typst](https://img.shields.io/badge/Engine-Typst-239120?style=for-the-badge&logo=rust)
![Universe](https://img.shields.io/badge/Typst-Universe-blue?style=for-the-badge)

A high-density, mindmap-inspired technical cheatsheet template for Typst. Optimized for close-up technical reading on monitors or large-format prints.

## 🚀 Key Features

- **📐 Sidebar Anchor**: Vertical rotated title frees up vertical space for content.
- **🧱 Atomic Masonry**: Content flows vertically and fills gaps organically without splitting boxes.
- **💎 Vector Integrity**: Built-in connectors and blueprint background for an architectural feel.
- **🤖 AI-Ready**: Optimized for agent-assisted content generation.

## 🛠️ Usage

### From Typst Universe
Add this to your `main.typ`:

```typst
#import "@preview/mindmap-cheatsheet:0.1.0": *

#show: body => poster(
  title: "MY SYSTEM ARCHITECTURE",
  authors: ("Your Name",),
  body
)

#columns(3, gutter: 0.5cm)[
  #section-box(title: "PHASE 1", color: olive)[
    #step-box(
      title: "Discovery",
      desc: "Analyze requirements deeply.",
      prompt: "What are the core metrics?",
      result: "Documented PRD."
    )
  ]
]
```

### Local Development
1. Clone the repo.
2. Run `typst watch main.typ`.
3. Edit `data/*.json` to update content.

---

## 🗺️ Components

### `poster`
The main layout wrapper. Handles page configuration, sidebar title, and background grid.

### `section-box`
A high-level container for phases or topics. Supports custom accent colors.

### `step-box`
A granular, high-density component for individual steps.
- `title`: Step heading.
- `desc`: Main description.
- `prompt`: (Optional) Example user prompt.
- `result`: (Optional) Expected outcome.
- `failure`: (Optional) Common failure points.
- `fix`: (Optional) Resolution steps.

### `connector`
Absolute-positioned vector lines to link boxes in a mindmap style.

---

## 📜 License
MIT © Abuhafi
