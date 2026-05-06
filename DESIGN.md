---
name: Claude-Green
version: alpha
description: A warm-canvas editorial interface inspired by Anthropic's Claude, but shifted toward an organic, lush green palette. The system anchors on a tinted cream canvas with slab-serif display headlines and deep fern-green accents.
colors:
  primary: "#4F7942"    # Fern Green (Replaces Claude's Coral)
  primary-active: "#3E5F34"
  primary-disabled: "#E6DFD8"
  ink: "#141413"        # Warm Dark Ink
  body: "#3D3D3A"
  canvas: "#FAF9F5"     # Tinted Cream (The classic Claude floor)
  surface-card: "#EFE9DE"
  surface-dark: "#181715"
  accent-leaf: "#88B04B" # Soft Leaf Green for highlights
  neutral: "#FAFAFA"
  danger: "#F87171"
  info: "#06B6D4"
typography:
  h1:
    fontFamily: "Copernicus, Tiempos Headline, serif"
    fontSize: 32pt
    fontWeight: 400
    letterSpacing: -0.5px
  body-md:
    fontFamily: "StyreneB, Inter, sans-serif"
    fontSize: 10pt
    lineHeight: 1.55
  label-caps:
    fontFamily: "StyreneB, Inter, sans-serif"
    fontSize: 11pt
    fontWeight: bold
rounded:
  sm: 6px
  md: 8px
  lg: 12px
spacing:
  margin: 1.5cm
  gutter: 1cm
components:
  section-box:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    rounded: "{rounded.lg}"
  header-block:
    backgroundColor: "{colors.primary}"
    textColor: "#FFFFFF"
---

## Overview

The **Claude-Green** aesthetic is "Academic Growth." It combines the sophisticated, editorial feel of a high-end literary journal with an organic, green-tinted energy. It evokes the feeling of a sun-drenched botanical library.

## Colors

The palette anchors on the warmth of the cream canvas, punctuated by deep, forest-inspired greens.

- **Primary (#4F7942):** Fern Green. Used for major headers and primary actions. It feels stable and natural.
- **Canvas (#FAF9F5):** The "Claude Floor." A warm, tinted cream that removes the harshness of pure white.
- **Ink (#141413):** A warm, deep off-black used for all high-contrast text.

## Typography

The system uses a classic **Serif/Sans-Serif split** to create an editorial rhythm.

- **H1 (Copernicus/Serif):** Regular weight (400) with slight negative tracking to feel like a printed book title.
- **Body (Inter/Sans):** Humanist proportions for long-form reading comfort.

## Layout & Spacing

We use a spacious A3 grid that prioritizes breathing room, mirroring the "generous whitespace" philosophy of modern AI interfaces.

- **Gutter (1cm):** Ensures that even dense information feels organized.
- **Rounded (12px):** Larger radii on cards to feel soft and approachable.

## Components

- **Section Box:** Uses the `{colors.canvas}` for a warm, paper-like feel within the grid.
- **Header Block:** Uses the `{colors.primary}` fern green to anchor the user's attention.
