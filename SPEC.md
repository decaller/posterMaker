# Technical Specification: PosterMaker

## Vision
A code-driven factory for creating professional, accessible (Tagged PDF), and high-visual cheatsheets using Typst and JSON.

## Core Architecture
- **Engine**: Typst (Rust-based).
- **Data Source**: JSON files in `data/`.
- **Layout**: `template.typ` (Design System) + `main.typ` (Renderer).
- **Automation**: GitHub Actions for PDF compilation and `llms.txt` updates.

## Design Constraints
1. **Vector-Only**: No raster images (PNG/JPG) allowed for graphics. Use Typst code or SVG.
2. **Accessible**: Must use semantic headings (`=`, `==`) for screen readers.
3. **Responsive**: The layout must support variable column spans (1, 2, or 3).
4. **Agent-Friendly**: Every decision must be documented in `llms.txt` for AI context.

## User Persona
- **Developers**: Who want to "code" their documentation.
- **AI Agents**: Who need a predictable schema to generate content.
- **Designers**: Who want a stable, grid-based system for visual cheatsheets.
